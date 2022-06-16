import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { RoutinesOverviewPageRoutingModule } from './routines-overview-routing.module';

import { RoutinesOverviewPage } from './routines-overview.page';
import { RoutineComponentModule } from 'src/app/components/routine-item/routine.module';
import { AppFrameComponentModule } from 'src/app/components/app-frame/app-frame.module';

import { HttpClientModule } from '@angular/common/http'

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AppFrameComponentModule,
    RoutineComponentModule,
    RoutinesOverviewPageRoutingModule,
    HttpClientModule
  ],
  declarations: [RoutinesOverviewPage]
})
export class RoutinesOverviewPageModule {}
