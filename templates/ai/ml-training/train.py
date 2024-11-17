import torch
from torch import nn
from torch.utils.data import DataLoader
import lightning as L
from model import Model
from data_loader import DataModule
import wandb
from utils import set_seed

class TrainingModule(L.LightningModule):
    def __init__(self, model: nn.Module, learning_rate: float = 1e-3):
        super().__init__()
        self.model = model
        self.learning_rate = learning_rate
        self.criterion = nn.CrossEntropyLoss()
        
    def training_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self.model(x)
        loss = self.criterion(y_hat, y)
        self.log('train_loss', loss)
        return loss
        
    def validation_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self.model(x)
        loss = self.criterion(y_hat, y)
        self.log('val_loss', loss)
        
    def configure_optimizers(self):
        return torch.optim.Adam(self.model.parameters(), lr=self.learning_rate)

def train(
    data_path: str,
    model_config: dict,
    train_config: dict,
    experiment_name: str
):
    set_seed(42)
    
    wandb.init(
        project=experiment_name,
        config={**model_config, **train_config}
    )
    
    data_module = DataModule(data_path, **train_config)
    
    model = Model(**model_config)
    training_module = TrainingModule(model, train_config['learning_rate'])
    
    trainer = L.Trainer(
        max_epochs=train_config['epochs'],
        accelerator='auto',
        logger=L.pytorch.loggers.WandbLogger()
    )
    
    trainer.fit(training_module, data_module)
    
    trainer.save_checkpoint(f'models/{experiment_name}.ckpt')