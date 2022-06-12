import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { RoutinesOverviewPage } from './routines-overview.page';

const routes: Routes = [
  {
    path: '',
    component: RoutinesOverviewPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class RoutinesOverviewPageRoutingModule {}
