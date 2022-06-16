import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Task } from 'src/app/data/task';
import { DataService } from 'src/app/services/data.service';

@Component({
  selector: 'app-task',
  templateUrl: './task.page.html',
  styleUrls: ['./task.page.scss'],
})
export class TaskPage implements OnInit {
  task: Task;

  constructor(
    private activatedRoute:ActivatedRoute,
    private dataService: DataService
    ) { }

  ngOnInit() {
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    this.dataService.getTaskById(parseInt(id, 10))
                    .subscribe({
                      next: _task => {
                        this.task = _task;
                      }
                    });
  }

}
