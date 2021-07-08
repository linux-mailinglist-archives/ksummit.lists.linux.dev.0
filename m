Return-Path: <ksummit+bounces-350-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3C3C172C
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1C26F1C0F21
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0710C2F80;
	Thu,  8 Jul 2021 16:38:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEF70
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 16:38:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 664AD61414
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625762295;
	bh=e3mguIHkolO/cnXgHODiOPYxxjRyxVbm5V0UT2QuBnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m24VkzWkT/BZtOSVtFaFSHIILBlD2ew4cGRA6llGrMxTUTzfDu/bj77jb8FN3z8AC
	 88Hmvu4NawwGlNisCnt0/YBCazXf1+GTmS7ZngyB8VObrGMUesyMOv5sVgCbQIso46
	 6yZvqTg/NsapBZUj9mJ78TLrdSCJme4YP5tD4QREOXl6+HnLFYBS4jd8wJ1dubHm34
	 A4v+oppH2dZSpKbFJGE53kfehPD378tRY6yz3VdJKYzyhrZibLlX6pPAumV/9BcPgx
	 sDnoySF4mKWF0uA+QLgLt04NskSC6B+T9iv9eMsJfAuo5utMvy9Lo0rMLt/afMldmf
	 P71aII6VtuB/A==
Received: by mail-ej1-f45.google.com with SMTP id he13so10688039ejc.11
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 09:38:15 -0700 (PDT)
X-Gm-Message-State: AOAM530oNXrqrAwu5ByBJz5+O/18O03XUUExBufBq3opiRxpKaFmRsHA
	1/RZMarJy1ERH+ZjsEkHtHoDfXetUz96pceTNcGcuA==
X-Google-Smtp-Source: ABdhPJz7JDHvx7Xq4HiioeoD7LO2ZpciV52yeUj/bvz+1k8j5AZ2+oIDtmyhPoNBkuVgBBA0Je5r47od9/lvC0UQvkw=
X-Received: by 2002:a17:906:c34e:: with SMTP id ci14mr3842708ejb.199.1625762294019;
 Thu, 08 Jul 2021 09:38:14 -0700 (PDT)
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
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 8 Jul 2021 09:38:01 -0700
X-Gmail-Original-Message-ID: <CALCETrUo5iLqOqd25xaDWa22ohxW5MZAOU5G=-Cu+OGy0534Ew@mail.gmail.com>
Message-ID: <CALCETrUo5iLqOqd25xaDWa22ohxW5MZAOU5G=-Cu+OGy0534Ew@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 7:58 AM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Jul 08, 2021 at 03:55:31PM +0200, Miguel Ojeda wrote:
> >     On Thu, Jul 8, 2021 at 8:11 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > Thanks for the detailed explainations, it seems rust can "get away" with
> > > some things with regards to reference counts that the kernel can not.
> > > Userspace has it easy, but note that now that rust is not in userspace,
> > > dealing with multiple cpus/threads is going to be interesting for the
> > > language.
> >
> > Regarding parallelism, userspace deals with the same problems, so I do
> > not see fundamental issues coming up there. The language was designed
> > with parallelism in mind and is a definite improvement over both C and
> > C++ in that regard.
>
> Ok, great, then how would you handle the kref issue where you need an
> external lock to properly handle the reference counting logic in Rust?
> Why is C so "bad" here that we require a lock but Rust would not?

Can you point at a specific example in the kernel tree?  The
lock-and-then-put model is, at the very least, unusual, and the kref
docs talk about it like it's common and self-explanatory as to when
it's needed.  I have personally never encountered a need for this, and
I'd like to know exactly what type of use case you're thinking of.

> Ok, what "model" would be better?  We need a "base object" that has
> solid lifecycle rules.  Right now we do have that, but it's just not the
> easiest to use for complex objects where we have multiple objects with
> different lifecycles that all interact together.  The v4l example is the
> best, but the input layer also has this type of issue.
>

