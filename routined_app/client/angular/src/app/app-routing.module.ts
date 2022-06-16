import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'home',
    loadChildren: () => import('./pages/home/home.module').then( m => m.HomePageModule)
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'routines-overview',
    loadChildren: () => import('./pages/routines-overview/routines-overview.module').then( m => m.RoutinesOverviewPageModule)
  },
  {
    path: 'routine/:id',
    loadChildren: () => import('./pages/routine/routine.module').then( m => m.RoutinePageModule)
  },
  {
    path: 'task/:id',
    loadChildren: () => import('./pages/task/task.module').then( m => m.TaskPageModule)
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
