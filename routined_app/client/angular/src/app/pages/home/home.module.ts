import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';

import { HomePage } from './home.page';
import { HomePageRoutingModule } from './home-routing.module';
import { RoutineComponentModule } from 'src/app/components/routine-item/routine.module';
import { AppFrameComponentModule } from 'src/app/components/app-frame/app-frame.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AppFrameComponentModule,
    RoutineComponentModule,
    HomePageRoutingModule
  ],
  declarations: [HomePage]
})
export class HomePageModule {
  
}
