Return-Path: <ksummit+bounces-302-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C83BECBD
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 912031C0E2E
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B802FAE;
	Wed,  7 Jul 2021 17:01:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609DD72
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 17:01:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u8so3858232wrq.8
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7158nsUE4yeFakV63nz2/C2ogi/O5pOT7V8CbPKcO4Y=;
        b=dboIw+RGHny8F+rLIwakzQiVDIi0g++H8CXbR2TKyHvGTLVqoHkjCU+LruRmhCT1Ji
         DwliC9+jH6YsBBVEDSFjw9fZC2XaTm5t2Fc8HeWE3IU0pmxY32oJp8J9lR5uJl9wbIa4
         ByD65uoR0Ycl0QZBrM8OFmUH1B3UUEUBBlAMzySWXetatvPAqfVR9JzfxsL6DY61uxeM
         KqlRhxVVLa4li0Kzmo4Cik9ftyt8jNxcHJxojubDTY9TxlxeGYd7ulMNdgFEH3T/vkNC
         +BUqBgnvzxwheNNjqsOwYb2p9rDtl1yqp98OlDRGHbL3a3RXQWYIdOAHhLRH8X5aISYv
         dYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7158nsUE4yeFakV63nz2/C2ogi/O5pOT7V8CbPKcO4Y=;
        b=nlppW/NF9vPJxw4dIgPV9sNDSfR0NFKnQ/N748JlC6soS8/rnpiaNuN3icKPOl+gA1
         FEm7wrNM0GFebWwP8yNf/QAJhFH3JtoX2tLJ8YSkp5U48vIqrdpIwE2Q7bfuNIeS9ANM
         7JI4+S7UiLaS8C0WzlS6K6ivWxhyfjYLqBFF9/PSaj13ZWKKR0PzRWwp1CFAdmJJ5B78
         2SbisxO7hSi3gf5HmETxxejTuE2z2rxHuHADPbVLHmo7dmEJjhxto/+f3fZNhAAUEr3p
         oz1hvKQbzlhcjY+QXmq9Qo5PDWagEus729zIsCiAdmxd0k9r46hr1O3z1cxzqyzCW01u
         9eKg==
X-Gm-Message-State: AOAM532kgqnnpZnTn0U1SFF6fRZCYFLAKtwUeEhZer6YLZqlnCjnHZnp
	rFrC47igKpeMtNHugqu6/fyf
X-Google-Smtp-Source: ABdhPJzqmWQH9gSEbzVg3+yCbyidyFzDOlbvgH3b33RCwLK9HtW2yJXE97pZvoqpOse0/EqXHN81jA==
X-Received: by 2002:a5d:530f:: with SMTP id e15mr28594514wrv.217.1625677305583;
        Wed, 07 Jul 2021 10:01:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:860d:625a:fd59:d699])
        by smtp.gmail.com with ESMTPSA id r13sm10577723wrt.38.2021.07.07.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 10:01:45 -0700 (PDT)
Date: Wed, 7 Jul 2021 18:01:41 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOXd9WoafgBr1Nkv@google.com>
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOXL6Th+pot9+Fp3@kroah.com>

On Wed, Jul 07, 2021 at 05:44:41PM +0200, Greg KH wrote:
> On Wed, Jul 07, 2021 at 05:15:01PM +0200, Miguel Ojeda wrote:
> > For instance, we have a `Ref` type that is similar to `Arc` but reuses
> > the `refcount_t` from C and introduces saturation instead of aborting
> > [3]
> > 
> > [3] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/arc.rs
> 
> This is interesting code in that I think you are missing the part where
> you still need a lock on the object to prevent one thread from grabbing
> a reference while another one is dropping the last reference.  Or am I
> missing something?

You are missing something :)

> The code here:
> 
>    fn drop(&mut self) {
>         // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
>         // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
>         // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
>         // freed/invalid memory as long as it is never dereferenced.
>         let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
> 
>         // INVARIANT: If the refcount reaches zero, there are no other instances of `Ref`, and
>         // this instance is being dropped, so the broken invariant is not observable.
>         // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
>         let is_zero = unsafe { rust_helper_refcount_dec_and_test(refcount) };
>         if is_zero {
>             // The count reached zero, we must free the memory.
>             //
>             // SAFETY: The pointer was initialised from the result of `Box::leak`.
>             unsafe { Box::from_raw(self.ptr.as_ptr()) };
>         }
>    }
> 
> Has a lot of interesting comments, and maybe just because I know nothing
> about Rust, but why on the first line of the comment is there always
> guaranteed a reference to the object at this point in time?

It's an invariant of the `Ref<T>` type: if a `Ref<T>` exists, there necessarily
is a non-zero reference count. You cannot have a `Ref<T>` with a zero refcount.

`drop` is called when a `Ref<T>` is about to be destroyed. Since it is about to
be destroyed, it still exists, therefore the ref-count is necessarily non-zero.

> And yes
> it's ok to have a pointer to memory that is not dereferenced, but is
> that what is happening here?

`refcount` is a raw pointer. When it is declared and initialised, it points to
valid memory. The comment is saying that we should be careful with the case
where another thread ends up freeing the object (after this thread has
decremented its share of the count); and that we're not violating any Rust
aliasing rules by having this raw pointer (as long as we don't dereference it).
 
> I feel you are trying to duplicate the logic of a "struct kref" here,

`struct kref` would give us the ability to specify a `release` function when
calling `refcount_dec_and_test`, but we don't need this round-trip to C code
because we know at compile-time what the `release` function is: it's the `drop`
implementation for the wrapped type (`T` in `Ref<T>`).

> and that requires a lock to work properly.  Where is the lock here?

We don't need a lock. Once the refcount reaches zero, we know that nothing else
has pointers to the memory block; the lifetime rules guarantee that if there is
a reference to a `Ref<T>`, then it cannot outlive the `Ref<T>` itself. To
produce a new `Ref<T>` from an existing one, `clone` is called, which increments
the refcount.

For cases when you want to hold on to something without incrementing its
refcount, the common pattern in Rust is to use "weak" pointers. `Ref<T>` doesn't
support them because we haven't needed them yet and they have extra cost.
(`Arc<T>` supports them though.)

