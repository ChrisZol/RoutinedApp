import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { RoutinePageRoutingModule } from './routine-routing.module';

import { RoutinePage } from './routine.page';
import { TaskComponentModule } from 'src/app/components/task-item/task.module';
import { AppFrameComponentModule } from 'src/app/components/app-frame/app-frame.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AppFrameComponentModule,
    TaskComponentModule,
    RoutinePageRoutingModule
  ],
  declarations: [RoutinePage]
})
export class RoutinePageModule {}
