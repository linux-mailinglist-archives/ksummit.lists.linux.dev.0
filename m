Return-Path: <ksummit+bounces-335-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698953C1457
	for <lists@lfdr.de>; Thu,  8 Jul 2021 15:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id ECB563E10AD
	for <lists@lfdr.de>; Thu,  8 Jul 2021 13:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562012F80;
	Thu,  8 Jul 2021 13:36:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE8168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 13:36:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v5so7596440wrt.3
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qgf0108jSvWcnrG8UaqYzun9FG7QLcUlmyFyaOxsDrI=;
        b=ahGxF+OrIJqwugdTUQc5ZsIO01rrXSg5W/dQg7/ELiSununMQDr5HBB8fwH3vOXP6m
         k75kRxavYoS1e+IUR68iway06sXV5y7urm2YvS4twjoWn+WGdfMSlR29b30yngG6hEHI
         SRjM5kD++ywdz65MuQKuBdEA2pMvrM8PEK4XdbRJunulNJetgovFb7q20/Q0lC00aQun
         DjG0s1pIG06vU8FU7aWtl3xrwh6UBdIJTLJY/+shqHrkaSo7RDWZB+RnvauH8Uht/C62
         wdj1tzq+6OiZ7dH3IiLZLEahKZTnMjcT2aP0BkDNjgm1QNtRX5+QUMCrBD387aEX0Ufw
         3s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qgf0108jSvWcnrG8UaqYzun9FG7QLcUlmyFyaOxsDrI=;
        b=pMwKLaEC1axDSG5BSQoKpy9RGB94NaiKRjpq5cBCQ5seAGDjp1LhkuJVrcmVQdJqWo
         i3DetBup0M8xFo7YQYyyF5VGKwiv6EKz3FibCZG/TZMd2JEfdtAP+//TwE0U3b6mkMgY
         D6Bk+STnTkO2ovR3jkhp95L0fZHpc1q4VZk48hmboXo0kTCCf1jfz/+atRTDezjIo7QN
         xiJKWr+icE5cUj+3Vl/ldE9qaOp+u/oGHlJ3FXwN2t6jN9tRQydMUklOKPnrclb3k+Yf
         sUr3HbEgw7WnHLI8/58/lBQoxYwEAvJ8/xjnO55qYJ/oB/gyls5LTibU4lwXx0Lqo0Cp
         rAUQ==
X-Gm-Message-State: AOAM531098j1FJ8gvHblZw3dI9fbxkiAU1HsF9mX6SN9h5xOBkdRE0UH
	MIRf8eJVVUL/I4jEpnkqR7iM
X-Google-Smtp-Source: ABdhPJxQshvtvSjzTP7pMqiuS33M7op7SyA7y0asCJ8CVPkRAvspZrDl5IT49Jake/qC0JwumG8wcA==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr33467240wrp.43.1625751405008;
        Thu, 08 Jul 2021 06:36:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:a098:e45d:317:5eca])
        by smtp.gmail.com with ESMTPSA id j10sm2258893wrt.35.2021.07.08.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 06:36:44 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:36:40 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Greg KH <greg@kroah.com>
Cc: Jan Kara <jack@suse.cz>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOb/aJC2VuOcz3YY@google.com>
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOaW/pR0na5N9GiT@kroah.com>

On Thu, Jul 08, 2021 at 08:11:10AM +0200, Greg KH wrote:
> Thanks for the detailed explainations, it seems rust can "get away" with
> some things with regards to reference counts that the kernel can not.
> Userspace has it easy, but note that now that rust is not in userspace,
> dealing with multiple cpus/threads is going to be interesting for the
> language.
>
> So, along those lines, how are you going to tie rust's reference count
> logic in with the kernel's reference count logic?  How are you going to
> handle dentries, inodes, kobjects, devices and the like?  That's the
> real question that I don't seem to see anyone even starting to answer
> just yet.

None of what I described before is specific to userspace, but I understand your
need to see something more concrete.

I'll describe what we've done for `task_struct` and how lifetimes, aliasing
rules, sync & send traits help us achieve zero cost (when compared to C) but
also gives us safety. The intention here is to show that similar things can (and
will) be done to other kernel reference-counted objects when we get to them.

So we begin with `current`. It gives us access to the current task without
incurring any increments or decrements of the refcount; in Rust, we'd do the
following:

  let current = Task::current();

We can use it for however long we'd like as long as it's in the same task. But
how do we restrict that? Rust has this `Send` trait that tells it that a type
can be used by another thread/CPU; `current`'s type doesn't isn't `Send`, so
attempting to send it another thread fails. For example, if we tried this:

  send_to_thread(current);

We'd get the following compiler error:

    |
195 | fn send_to_thread<T: Send>(t: T) {
    |                      ---- required by this bound in `send_to_thread`
...
201 |     send_to_thread(current);
    |     ^^^^^^^^^^^^^^ `*mut ()` cannot be sent between threads safely
    |
    = help: within `TaskRef<'_>`, the trait `Send` is not implemented for `*mut ()`
    = note: required because it appears within the type `(&(), *mut ())`
    = note: required because it appears within the type `PhantomData<(&(), *mut ())>`
note: required because it appears within the type `TaskRef<'_>`

One option we do have is to send a "reference" to `current` to another thread.
This works and is zero-cost. It is safe because the lifetime of the reference is
tied to that of `current`. (And `current`'s type is `Sync`, which means that a
reference to it is safely shareable with another thread/CPU.)

So calling:

  send_to_thread(&current);

Works fine. But its implementation must convince the compiler that by the time
it returns the sharing with another thread is over. Otherwise it would be a
violation of lifetime requirements (a borrow cannot outlive the borrowed value)
and compilation would fail.

Now, similarly to my example in another email, if you really want the task to
outlive `current`, then you can call `clone`. This results in `get_task_struct`
being called, so now we can send it another thread that can hold on to it and
this is all safe. For example:

    let current = Task::current();
    let task = current.clone();
    send_to_thread(task);

Now, the other task *owns* the reference, so we're not supposed to use `task` at
all (suppose for a moment that it's some arbitrary task, not current). In C,
given that there is no ownership discipline enforced by the compiler, one could
easily make the mistake of using `task` (which is unsafe because the other
thread/CPU may have decremented its refcount and freed it by now). In Rust, an
attempt to use `task` would fail; for example:

    let current = Task::current();
    let task = Task::current().clone();
    send_to_thread(task);
    pr_info!("Pid is {}", task.pid());

Would result in the following compilation error:

error[E0382]: borrow of moved value: `task`
   --> rust/kernel/task.rs:203:34
    |
201 |     let task = Task::current().clone();
    |         ---- move occurs because `task` has type `Task`, which does not implement the `Copy` trait
202 |     send_to_thread(task);
    |                    ---- value moved here
203 |     pr_info!("Pid is {}", task.pid());
    |                           ^^^^ value borrowed here after move

(Note that `task` is inaccessible despite still being in scope.)

Another common mistake is to leak references by forgetting to call
`put_task_struct`. Rust helps prevent this by automatically calling it when
needed, including error paths. Suppose we have a function that allocates some
struct that includes a task field, for example:

struct X {
    task: Task,
    a: u64,
    b: u64,
}

fn alloc_X(task: Task) -> Result<Box<X>> {
    Box::try_new(X {
        task: task,
        a: 10,
        b: 20
    })
}

Here, if the function fails (e.g., the allocation in `try_new` fails), the task
refcount is automatically decremented when the function returns. If it succeeds,
ownership is transferred to the new instance of X, and the refcount will be
decremented automatically when this instance of X is eventually freed.

Another example that shows lifetimes clearly is that of `group_leader`. Given a
task, its group leader can be accessed with zero-cost but this access is
subjected to lifetime requirements. For example:

    let task = get_some_task();
    let leader = task.group_leader();
    pr_info!("Pid is {}", leader.pid());

Works with zero cost (i.e., no extra inc/ref of the group leader). But the
following:

    let leader;
    {
        let task = get_some_task();
        leader = task.group_leader();
    }
    pr_info!("Pid is {}", leader.pid());

Fails with the following error:

error[E0597]: `task` does not live long enough
   --> rust/kernel/task.rs:209:18
    |
209 |         leader = task.group_leader();
    |                  ^^^^ borrowed value does not live long enough
210 |     }
    |     - `task` dropped here while still borrowed
211 |     pr_info!("Pid is {}", leader.pid());
    |                           ------ borrow later used here

Because task's refcount is decremented at the end of the scope.

So, you see, I understand that you want to see refcounts in action on the
objects you care about. But I don't think the claim that no one has even tried
to answer the general refcount question is accurate. I hope it is clear that we
have thought about some of this. You could also check out what we've done for
file references and even file-descriptor creation with transaction semantics for
how it all fits beautifully (and safely). (I won't get into them here because
this email is already too long.)

I'm happy to go into more details for any of the examples above if anything
isn't clear.

> And that's the reason some of us are asking to see a "real" driver, as
> those have to deal with these kernel-controlled-reference-counted
> objects properly (as well as hardware control).  Seeing how that is
> going to work in this language is going to be the real sign of if this
> is even going to be possible or not.

Here's what I'd like to avoid: spending time on something that you all still
think is not typical enough. Would you be able to point us to a driver that
would showcase the interactions you'd like to see so that (once we have it in
Rust) we can have a discussion about the merits of the language?

Hopefully something with interesting interactions with the kernel, but not
with overly complex hardware, that is, something that doesn't require us to read
a 400-page specification to implement.

Thanks,
-Wedson

