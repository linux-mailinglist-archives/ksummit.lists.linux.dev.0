Return-Path: <ksummit+bounces-351-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 462163C18CD
	for <lists@lfdr.de>; Thu,  8 Jul 2021 20:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 75CD53E10DE
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAA12F80;
	Thu,  8 Jul 2021 18:00:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705670
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 18:00:27 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id k16so9234032ios.10
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+v9Kvl8er8AkJfBFUHJP3m1/Mzyd4q/kYM+1Wlmn0c=;
        b=ttP9kHyMWNCpLeLwITDVkMKD7BJ/82j+WTEMU48+7FqyQQyW4692VDEVty7Lye7DEG
         KqpFTqtjuh2ih634grP5VwnEM2pFLup0HagTf9fjHm8DG9E5ZSORZ/sm2qcjhEMDg+SR
         HVdFJ7vdH/LD24lmJNuV2mHn8/fmi54C7HTxIKmOTEhTB6qKri0qtw35JTq+IQH4CNfd
         hWBGSCWzEjy4vdD/XYzl+dzNwcbj10xVc66oxEf1Xc8cfFBml2402J308CjR+WlfdkBg
         x/8PmORijOIM7bp0PI93QEOMwC5V3hi9zVe2lz+l/rO2SRbQfrsHyXSUh3YB8OWUJIUD
         hIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+v9Kvl8er8AkJfBFUHJP3m1/Mzyd4q/kYM+1Wlmn0c=;
        b=XztQrDusw07KrdnW7jAg8sfpPXtewfdmR/I7J8y5M71saErspdBXA156xLIDjXBB/a
         YDWiJ+PKfQF4+xu1nU5VTyGCtilI0eDSEd95M+cknggE/dud6lq0P2tZFZze1En8idlO
         imEqpzfLE+wDNny3PNcfs9W91m0uzIQ1rOeWtAmppAr2ryq2wXdhmA+ftnHUlZaZNEKq
         po6It9DMJm3PgMDdQ3uKG7fLhGLZjVjFzgFcYunqV+FWdoTeiTlBP7PXjlKvAA+VIFPL
         WFUM6c6EMGyV8x3LApvZUe690gydzMSgIS8AvyuJwBFqDspFFv6yG7g2YDjHlsuPwlEt
         ixsg==
X-Gm-Message-State: AOAM531MX9xgiX1h3oZ4uHZIQTxoanMHp3RSFy7LTdZUIlyiIWzNKY8T
	AZ2McyvVRMO4HFNzMqnYEx1OwJainBMIF/y+TO8=
X-Google-Smtp-Source: ABdhPJy2fm3oIGss6XFP3opjTuexqZ/tkw6Re/02C9CPm508jCOnod54YebGWbG5Pbb9SgLaF4OjsMTENfGT3t/Ctsg=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr24923319iom.149.1625767226997;
 Thu, 08 Jul 2021 11:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <CANiq72kEfZ1NxSNrcDpavkq256YsiZSLkV_EABPZPQAE=VkaVg@mail.gmail.com>
 <YOcSo3ilu+ACDnBJ@kroah.com>
In-Reply-To: <YOcSo3ilu+ACDnBJ@kroah.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 20:00:15 +0200
Message-ID: <CANiq72mGRPqZEB2vTPxP4L5nNc-_0s2d=zCMi1BiVZHjPkeBnA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 4:58 PM Greg KH <greg@kroah.com> wrote:
>
> Ok, great, then how would you handle the kref issue where you need an
> external lock to properly handle the reference counting logic in Rust?
> Why is C so "bad" here that we require a lock but Rust would not?

That's the thing: neither C nor Rust need a lock to handle the
refcount itself, i.e. `kref` does not contain a lock, neither `Ref<T>`
does.

A lock is needed when you actually interact with the contents that are
refcounted (see my previous message about `Ref<T>`) -- and this
applies the same way to Rust and C.

What Rust is buying is, though, and this is the critical point, is
that we cannot make a mistake forgetting that we need to have some
form of lock to concurrently mutate things nor forgetting we need to
actually lock it.

Thus, in a way, you could think that the rules in `Doc/kref.txt` would
be now enforced statically -- that is the difference.

> Ok, what "model" would be better?  We need a "base object" that has
> solid lifecycle rules.  Right now we do have that, but it's just not the
> easiest to use for complex objects where we have multiple objects with
> different lifecycles that all interact together.  The v4l example is the
> best, but the input layer also has this type of issue.

The model can be very similar conceptually, but if we can take the
freedom to manage the objects in the Rust side instead of forcing
ourselves to go through C APIs (e.g. `devm_*`, dealing with
self-referential structs, etc.), then things can be way simpler.

Which is why I am asking: so far we have tried hard to reuse the C
APIs and types, but if we can relax that constraint and come up with
our own model (where the Rust side keeps ownership of objects), then
we will likely end up with something better (for the Rust side).

Basically, the idea is doing things in a way that is amenable to
Rust's strengths, so that modules written in Rust are easier to write
and so that we minimize even further the need for `unsafe`.

To be extra clear: it is not that Rust cannot use/express/wrap those C
patterns -- the key is that some of those C patterns cannot be
statically proven to be correct by the Rust compiler (and thus require
trusting ourselves to get them right, like in C).

Cheers,
Miguel

