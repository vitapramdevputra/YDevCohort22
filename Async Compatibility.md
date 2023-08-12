Future
Can we call future method from a future method?
    - NO.
Can we call batch from a future method?
    - NO.
Can we enqueue queueable from future?
    - Yes.


Batch
Can we execute one batch class from another batch class?
    - Yes.
    - ONLY in FINISH METHOD. We cannot start another batch from 'start' or 'execute' method.
Can we call future method from a batch?
    - No.
Can we enqueue queueable from a batch?
    - Yes.

Queueable
Can we call queueable from queueable?
    - yes.
Can we call future from queueable?
Can we call batch from queueable?
    - yes, and yes.
