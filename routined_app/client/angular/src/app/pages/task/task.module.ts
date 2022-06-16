import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { TaskPageRoutingModule } from './task-routing.module';

import { TaskPage } from './task.page';
import { AppFrameComponentModule } from 'src/app/components/app-frame/app-frame.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AppFrameComponentModule,
    TaskPageRoutingModule
  ],
  declarations: [TaskPage]
})
export class TaskPageModule {}
