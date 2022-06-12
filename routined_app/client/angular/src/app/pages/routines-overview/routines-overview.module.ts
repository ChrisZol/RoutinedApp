import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { RoutinesOverviewPageRoutingModule } from './routines-overview-routing.module';

import { RoutinesOverviewPage } from './routines-overview.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RoutinesOverviewPageRoutingModule
  ],
  declarations: [RoutinesOverviewPage]
})
export class RoutinesOverviewPageModule {}
