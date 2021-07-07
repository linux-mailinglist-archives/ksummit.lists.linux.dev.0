Return-Path: <ksummit+bounces-308-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C833BF026
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A93C91C0E13
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501382F80;
	Wed,  7 Jul 2021 19:19:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00470
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 19:19:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j16-20020a05600c1c10b0290204b096b0caso2399622wms.1
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l5P6yFCcn7EhIuREc9rRFoQyX+ZMTR853cfoHstN1P0=;
        b=YfD3uvQbCRi0VBO9NUaTmFjBq3xC49ndWw+aWpeG4HjrDiArvratd9ZTbxBf1BtdPn
         DTz5jZze8/82dFWnKY9LGqajUsb0HPQomLlFUX6b2ZHOsMNqTK3yH414AccDlX05Jww8
         kC2rqzaEvvDn8qMVzB48Kiylx8UWroG/maMBkaKpQCg1tX9xadTbNPwBZdhBTn5imUqd
         TeDWVuG0jM6nkeCzQjPEv5KhrP4JD3KZPrbtWLzg0Pg48H6dj/CwIpeg+/EfKE8Lnbcj
         R8VmuCt+th1HcojfGI5AtSesk5vU+87jUYeRYIgbX0RB07mbiUt/aV0E7kafhtDwNHph
         AQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l5P6yFCcn7EhIuREc9rRFoQyX+ZMTR853cfoHstN1P0=;
        b=SZH8/i6gnouLy+v9V5vgcjGgCuHeOfZUpw8lEof3S+2JWTbBBsAMRIaRoptb8wQufm
         1SCovsdwx7TT6EdiKqbAehShgJ2ACgF87rsN+S+m05C+PXfBwgTgcUDsAus+QPG5JR8H
         CmG70Hu1GnryPZ6msWswu0e5dgPfWswrq1I/Lt2TPpRhOiejoLgMcU/tRWC1CUCbKeNx
         BGT3TvV4mujsO9DBhysjDn5+hQtzsP+jq/0e+r4VgylCfLmOl528bF6Nk/PZ9VNTiiXl
         Udk/P2shiwfDi4wwz6ynSK4Y2hUfDUwklxL8gymY9ER7aAK3rcG1H4ZyRAKdIJO3iPDs
         jm0Q==
X-Gm-Message-State: AOAM531VQ7rNxGe0AMz2saZQTxhQqdVZL/hVJMzzZv0OOwN4VJE2y0fb
	CNLsZDiPkrKiFleNGgrayZHh8ceIPIfj
X-Google-Smtp-Source: ABdhPJzBYjUG8Zyqu1MhZI0D4A07I/085VRiScDZZVy7Mx9a3yy5QsfmPXo8CYFVpLDNVFC5f6oFAA==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr28430866wmc.163.1625685568784;
        Wed, 07 Jul 2021 12:19:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:860d:625a:fd59:d699])
        by smtp.gmail.com with ESMTPSA id r16sm25261544wrx.63.2021.07.07.12.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 12:19:28 -0700 (PDT)
Date: Wed, 7 Jul 2021 20:19:19 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOX+N1D7AqmrY+Oa@google.com>
References: <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOXibDV8mHT1e6ec@kroah.com>

On Wed, Jul 07, 2021 at 07:20:44PM +0200, Greg KH wrote:
> On Wed, Jul 07, 2021 at 06:01:41PM +0100, Wedson Almeida Filho wrote:
> > On Wed, Jul 07, 2021 at 05:44:41PM +0200, Greg KH wrote:
> > > On Wed, Jul 07, 2021 at 05:15:01PM +0200, Miguel Ojeda wrote:
> > > > For instance, we have a `Ref` type that is similar to `Arc` but reuses
> > > > the `refcount_t` from C and introduces saturation instead of aborting
> > > > [3]
> > > > 
> > > > [3] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/arc.rs
> > > 
> > > This is interesting code in that I think you are missing the part where
> > > you still need a lock on the object to prevent one thread from grabbing
> > > a reference while another one is dropping the last reference.  Or am I
> > > missing something?
> > 
> > You are missing something :)
> > 
> > > The code here:
> > > 
> > >    fn drop(&mut self) {
> > >         // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
> > >         // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
> > >         // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
> > >         // freed/invalid memory as long as it is never dereferenced.
> > >         let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
> > > 
> > >         // INVARIANT: If the refcount reaches zero, there are no other instances of `Ref`, and
> > >         // this instance is being dropped, so the broken invariant is not observable.
> > >         // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
> > >         let is_zero = unsafe { rust_helper_refcount_dec_and_test(refcount) };
> > >         if is_zero {
> > >             // The count reached zero, we must free the memory.
> > >             //
> > >             // SAFETY: The pointer was initialised from the result of `Box::leak`.
> > >             unsafe { Box::from_raw(self.ptr.as_ptr()) };
> > >         }
> > >    }
> > > 
> > > Has a lot of interesting comments, and maybe just because I know nothing
> > > about Rust, but why on the first line of the comment is there always
> > > guaranteed a reference to the object at this point in time?
> > 
> > It's an invariant of the `Ref<T>` type: if a `Ref<T>` exists, there necessarily
> > is a non-zero reference count. You cannot have a `Ref<T>` with a zero refcount.
> 
> What enforces that?  Where is the lock on the "back end" for `Ref<T>`
> that one CPU from grabbing a reference at the same time the "last"
> reference is dropped on a different CPU?

There is no lock. I think you might be conflating kobject concepts with general
reference counting.

The enforcement is done at compile time by the Rust aliasing and lifetime rules:
the owner of a piece of memory has exclusive access to it, except when it is
borrowed. When it is borrowed, the borrow *must not* outlive the memory being
borrowed.

Unsafe code may break these rules, but if it exposes a safe interface (which
`Ref` does), then this interface must obey these rules.

Here's a simple example. Suppose we have a struct like:

struct X {
    a: u64,
    b: u64,
}

And we want to create a reference-counted instance of it, we would write:

  let ptr = Ref::new(X { a: 10, b: 20 });

(Note that we don't need to embed anything in the struct, we just wrap it with
the `Ref` type. In this case, the type of `ptr` is `Ref<X>` which is a
ref-counted instance of `X`.)

At this point we can agree that there are no other pointers to this. So if we
`ptr` went out of scope, the refcount would drop to zero and the memory would be
freed.

Now suppose I want to call some function that takes a reference to `X` (a
const pointer to `X` in C parlance), say:

fn testfunc(ptr_ref: &X) {
  ...
}

This reference has a lifetime associated with it. The compiler won't allow
implementations where using `ptr_ref` would outlive the original `ptr`, for
example if it escapes `testfunc` (for example, to another thread) but doesn't
"come back" before the end of the function (for example, if `testfunc` "joined"
the thread). Here's a trivial example with scopes to demonstrate the sort of
compiler error we'd get:

fn main() {
    let ptr_ref;
    {
        let ptr = Ref::new(X { a: 10, b: 20 });
        ptr_ref = &ptr;
    }
    println!("{}", ptr_ref.a);
}

Compiling this results in the following error:

error[E0597]: `ptr` does not live long enough
  --> src/main.rs:12:19
   |
12 |         ptr_ref = &ptr;
   |                   ^^^^ borrowed value does not live long enough
13 |     }
   |     - `ptr` dropped here while still borrowed
14 |     println!("{}", ptr_ref.a);
   |                    ------- borrow later used here

Following these rules, the compiler *guarantees* that if a thread or CPU somehow
has access to a reference to a `Ref<T>`, then it *must* be backed by a real
`Ref<T>` somewhere: a borrowed value must never outlive what it's borrowing. So
incrementing the refcount is necessarily from n to n+1 where n > 0 because the
existing reference guarantees that n > 0.

There are real cases when you can't guarantee that lifetimes line up as required
by the compiler to guarantee safety. In such cases, you can "clone" ptr (which
increments the refcount, again from n to n+1, where n > 0), then you end up with
your own reference to the underlying `X`, for example:

fn main() {
    let ptr_clone;
    {
        let ptr = Ref::new(X { a: 10, b: 20 });
        ptr_clone = ptr.clone();
    }
    println!("{}", ptr_clone.a);
}

(Note that the reference owned by `ptr` has been destroyed by the time
`ptr_clone.a` is used in `println`, but `ptr_clone` has its own reference due to
the clone call.)

The ideas above apply equally well if instead of thinking in terms of scope, you
think in terms of threads/CPUs. If a thread needs a refcounted object to
potentially outlive the borrow keeping it alive, then it needs to increment
the refcount: if you can't prove the lifetime rules, then you must clone the
reference.

Given that by construction the refcount starts at 1, there is no path to go from
0 to 1. Ever.

Where would a lock be needed in the examples above?

> Does Rust provide "architecture-specific" locks like this somehow that
> are "built in"?  If so, what happens when we need to fix those locks?
> Does that get fixed in the compiler, not the kernel code?

There are no magic locks implemented by the compiler.

> > `drop` is called when a `Ref<T>` is about to be destroyed. Since it is about to
> > be destroyed, it still exists, therefore the ref-count is necessarily non-zero.
> 
> "about to", yes, but what keeps someone else from grabbing it?

See my comments above. I'm happy to discuss any details that may not be clear.

> > > And yes
> > > it's ok to have a pointer to memory that is not dereferenced, but is
> > > that what is happening here?
> > 
> > `refcount` is a raw pointer. When it is declared and initialised, it points to
> > valid memory. The comment is saying that we should be careful with the case
> > where another thread ends up freeing the object (after this thread has
> > decremented its share of the count); and that we're not violating any Rust
> > aliasing rules by having this raw pointer (as long as we don't dereference it).
> >  
> > > I feel you are trying to duplicate the logic of a "struct kref" here,
> > 
> > `struct kref` would give us the ability to specify a `release` function when
> > calling `refcount_dec_and_test`, but we don't need this round-trip to C code
> > because we know at compile-time what the `release` function is: it's the `drop`
> > implementation for the wrapped type (`T` in `Ref<T>`).
> 
> That's not what I meant by bringing up a kref.  I was trying to ask
> where the "real" lock here is.  It has to be somewhere...
> 
> > > and that requires a lock to work properly.  Where is the lock here?
> > 
> > We don't need a lock. Once the refcount reaches zero, we know that nothing else
> > has pointers to the memory block; the lifetime rules guarantee that if there is
> > a reference to a `Ref<T>`, then it cannot outlive the `Ref<T>` itself.
> 
> Even with multiple CPUs?  What enforces these lifetime rules?

The compiler does, at compile-time. Each lifetime usage is a constraint that
must be satisfied by the compiler; once all constraints are gathered for a given
function, the compiler tries to solve them, if it can find a solution, then the
code is accepted; if it can't find a solution, the code is rejected. Note that
this means that some correct code may be rejected the compiler by design: it is
conservative in that it only accepts what it can prove is correct.

