abstract class Workflow {
  void start() {
    print('Workflow starting...');
    execute();
    print('Workflow finished.');
  }

  void execute();
}

class MyWorkflow extends Workflow {
  @override
  void execute() {
    print('Executing custom step');
  }
}

void main() {
  MyWorkflow wf = MyWorkflow();
  wf.start();
}
