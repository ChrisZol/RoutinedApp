import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Routine } from 'src/app/data/routine';
import { DataService } from 'src/app/services/data.service';
import { PickerController } from '@ionic/angular';
import { Task } from 'src/app/data/task';

@Component({
  selector: 'app-routine',
  templateUrl: './routine.page.html',
  styleUrls: ['./routine.page.scss'],
})
export class RoutinePage implements OnInit {
  routine: Routine;
  taskList: Task[];

  constructor(
    private activatedRoute: ActivatedRoute,
    private pickerController: PickerController,
    private dataService: DataService
    ) { }

  ngOnInit() {
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    console.log(id);
    this.dataService.getRoutineById(parseInt(id, 10))
      .subscribe({
        next: r => {
          console.log(r);
          this.routine = r;
          console.log(this.routine);
        }
      });
      this.dataService.getTasks(parseInt(id, 10))
        .subscribe({
          next: tasks => {
          this.taskList = tasks;
          console.log(tasks);
        }});
      console.log(this.routine);

    
  }

  async presentPicker() {
    const picker = await this.pickerController.create({
      buttons: [
        {
          text: 'Confirm',
          handler: (selected) => {
            this.routine.occurence = selected.occurence.value;
          },
        }
      ],
      columns: [
        {
          name: 'occurence',
          options: [
            { text: 'Daily', value: 'Daily' },
            { text: 'Weekly', value: 'Weekly' },
            { text: 'Monthly', value: 'Monthly' },
            { text: 'Yearly', value: 'Yearly' },
          ]
        }
      ]
    });
    await picker.present();
  }
}
