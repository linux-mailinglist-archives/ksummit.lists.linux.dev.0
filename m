Return-Path: <ksummit+bounces-366-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B63C1FD3
	for <lists@lfdr.de>; Fri,  9 Jul 2021 09:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BB4E53E1112
	for <lists@lfdr.de>; Fri,  9 Jul 2021 07:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6A42F80;
	Fri,  9 Jul 2021 07:05:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281470
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 07:05:03 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id h4so9042536pgp.5
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8GX6lCdyWc0UC3U1f8dmHjKesLKFV1v5YxIHwdeirU=;
        b=F7E4wEozpfZzFpGqgHG2MMb/sLP+zfFHf3Kw9DbTMYIW9CAoGvBr5agiHOZvyiMIF9
         qL6WNdDg/UiTQjWZtCPfdLz7lPj9eewN/z+2knaW2qkxaknHAY/rmiLWFN9Imn9qVrtz
         KSGOJ9nEBM4fRJJ3+4qyzlNpXPbhUdylJqnZo9aFwiW4zAwaFZWE2N2ik4mPpr2jrjfM
         LeRxc+G03gKDImJi4Bhg6d2nb7HexVKzArsyUZ8zjXPZlXLZ/JCUJC2jN8vQD9HuUSbG
         ChpjmBCDV4L/b6QnrikUNqVt5cDOnGScibevTAkgTaEkhBSYQaQ/CHe/W5oNvulPanXW
         egaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8GX6lCdyWc0UC3U1f8dmHjKesLKFV1v5YxIHwdeirU=;
        b=rUmROTJblFVaE5ud2M2v5VgTLdVVIpCZH0rJ4mdQhkaK+Mny0TTDKqVKtUAK7RWslV
         XQpzxveYxQWQ6TVrAmlNGZ2eKOdCRGhDolKR42wDFkW5Dcgj8af8rzfxQ5fQ7ny1Ddit
         rMQI+0p/hpk9te+UF+JcR06UsEDvhqTWbXnYkH8E2Ty1qb7QIKYTLW7CCsjSvHqpFLyC
         Y+vEgA3XnkMjV1zJ7fqrvlWVmdqHtZ0k5Flcp7nuPr2LkTsWBZNlueOAh+8/OgINoYOf
         fMaul2CciJuZig1iqTVB9QqmyB3JRIGL/qwVYIh/GEHsoaPUVOmr/96+nbRy3e9J4Qn/
         fHqA==
X-Gm-Message-State: AOAM5339LCnaSQQBeNqHB5UBg7CjlYPdjBVBg9ONowg6hpobkFQIsfP/
	/Pl1Ku5qeeMrq0Lq/tnMWk2LWrQe5jvNI598pyg=
X-Google-Smtp-Source: ABdhPJxue13scpVIhN+jpnzvdyj1H6Ox4kbzIWr9UXQeWJvS3K1DdSDaDJAVHBeokrRvjokDf1m9DJo1nraw4QEUc/8=
X-Received: by 2002:a62:64d2:0:b029:326:1ae3:1e7a with SMTP id
 y201-20020a6264d20000b02903261ae31e7amr12969184pfb.5.1625814303168; Fri, 09
 Jul 2021 00:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOXd9WoafgBr1Nkv@google.com> <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <YOcDnczZnF4helYJ@google.com> <CAMuHMdULCT3P6emoD08pEAt8ZZz0-FFwEOEuYXhcstisM==ZLQ@mail.gmail.com>
 <YOcKog8mBdl3LUv6@google.com>
In-Reply-To: <YOcKog8mBdl3LUv6@google.com>
From: Jerome Glisse <j.glisse@gmail.com>
Date: Fri, 9 Jul 2021 00:04:46 -0700
Message-ID: <CAH3drwaEHDONqeEVQUPC2_GXCB1K5ofkTQRWPcH0fZMjG4Rxrw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 7:24 AM Wedson Almeida Filho <wedsonaf@google.com> wrote:
>
> On Thu, Jul 08, 2021 at 04:16:54PM +0200, Geert Uytterhoeven wrote:
> > Hi Wedson,
> >
> > On Thu, Jul 8, 2021 at 3:54 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > > On Thu, Jul 08, 2021 at 03:43:28PM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Jul 8, 2021 at 3:42 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
> > > > > On Thu, Jul 08, 2021 at 09:20:25AM +0200, Geert Uytterhoeven wrote:
> > > > > > > Weak references need to upgraded to strong references before the underlying
> > > > > > > objects can be accessed; upgrading may fail if the strong count has gone to
> > > > > > > zero. It is, naturally, implemented as an increment that avoids going from 0 to
> > > > > > > 1. It is safe to try to do it because the memory is kept alive while there are
> > > > > > > weak references.
> > > > > >
> > > > > > What does "may fail" imply?
> > > > >
> > > > > Upgrading is essentially calling `refcount_inc_not_zero` on the strong count.
> > > > > It succeeds when the count is already non-zero, it fails when the count is zero.
> > > > >
> > > > > So "may fail" here means "your attempt to upgrade came too late, the object is
> > > > > gone". (The memory is still around so that attempts to upgrade don't cause UAF,
> > > > > but the object is gone.)
> > > >
> > > > So what happens if this fails?
> > >
> > > You move on the next element in your data structure. This one doesn't really
> > > exist anymore; once you release it lock, the cleanup code will likely come and
> > > remove it.
> >
> > I'm confused. Which next element?
>
> If you have a list of weak references, like in the original example, I'm
> referring to the next element of the list. If this is just a field of some other
> struct, then you're out of luck, you have to act as if the object didn't exist.
>
> > What happens if I have a weak reference to an object that cannot be
> > upgraded to a strong reference, and I try to access the object?
> > E.g. read from or write to a member of the object?
>
> You can't by construction. The returned type would be `Option<Ref<T>>`, so to
> access the fields of the returned object, you need something like:
>
>     if let Some(obj) = weak.upgrade() {
>         // `obj` is accessible here, you can access the fields.
>     }
>
> That is, if `upgrade` returns `None`, then you don't have a way to access the
> fields of your struct. This is similar in concept to locks, where the fields of
> a locked struct are only accessible when you acquire the lock.

So if we have a double linked list and one item is a zombie (for lack
of better word)
then we are stuck ie we can no longer go to the element after the
zombie until the zombie
has been released and removed from the weak list ? Which I assume can only
happen if the zombie element can get a strong reference on the element we are
stuck on (as we are stuck on the one before the zombie in the list).
It seems like a
deadlock to me. If the list is not embedded inside the structure then
we will have
poor cache performance and this is likely to degrade performances.

The double linked list is one of the most used data patterns in the
kernel and I fail
to see how it would look in rust. Especially case like rcu list where you
traverse the list and jump over zombie entries without thinking twice about it.

Cheers,
Jerome

