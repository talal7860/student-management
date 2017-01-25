import { Component } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'app works!';
  students;

  constructor(private http: Http) {
    http.get('http://localhost:3000/students.json')
        .subscribe(res => this.students = res.json());
  }
}
