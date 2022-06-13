import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { RoutinePageRoutingModule } from './routine-routing.module';

import { RoutinePage } from './routine.page';
import { TaskComponentModule } from 'src/app/components/task-item/task.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    TaskComponentModule,
    RoutinePageRoutingModule
  ],
  declarations: [RoutinePage]
})
export class RoutinePageModule {}
