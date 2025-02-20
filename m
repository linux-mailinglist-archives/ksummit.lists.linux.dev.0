Return-Path: <ksummit+bounces-1777-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71036A3E8BC
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F97116D3B9
	for <lists@lfdr.de>; Thu, 20 Feb 2025 23:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD1F267B10;
	Thu, 20 Feb 2025 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcT03REO"
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0B267737
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740095087; cv=none; b=CI47mqwg43USvWZxiKkgqK9+w+WZkrL0699U9R+ts53Cb6MxFncaz80/zHpNwTKK/cuduDZIKzzNfvhxvZapENQqEDGfqcAouIBQ36ilGoEvQ4iWuqqvGIo7yOESIBx0SjnXyhmxlxSKAenMuO+FQfzDw9UaRlf3LNXLs38kcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740095087; c=relaxed/simple;
	bh=p00AG8bb1yVHeSE4ONGqOFF7r1nxk9J2l+7gvdoptGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7Zp/cjSr5H5moBLxhPNrKQjddvCpWQ3hkPkdtHj4ZezSpowDUJaNdw5t59h3dfTTanAb8fj6EoWHXBp3uCSGVP3YUsaYh/p1GgGY4CmZkOFDjS3siNEMczp10FJHoj771KP7x3//DA3S1mctlbr/Zs0N7J+s4vo6WgTQOMoRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcT03REO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220cd9959f6so3915205ad.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740095084; x=1740699884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn5iQRJJBpnIS5VFzOOZKeekFoHGdGnyvULucCmT0Ik=;
        b=mcT03REO1PoIOUPv4McjafkQX3y+fM0QFc6jdy/2Wc01fa0k+5BrmUiLR1l6Ohusy5
         ArA14mjsK57rW7TfR4HAVacTFcVL+sOK1tBfB5eBoRqERKltDxg3cUcklIrGQZQcH0gS
         VC1Wr0nF98OmrYELiuLvoQn4LDlf+lWGYQvi25FhPdDV6kDkAQk2z10J9SL+2+QEb6Xk
         UoftO2CtP0H2gzmtMvadtPZM+IC9iDOculPK/XQ2yB3XsOe+cTfguLaCX7IcV1A3kQei
         AM1x4Es+fq5dUpMK8g7Np0PZEULKORYaaSbgYELGZqVs02Ryy7yjdnFvtgPyffdIRD7J
         vnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740095084; x=1740699884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn5iQRJJBpnIS5VFzOOZKeekFoHGdGnyvULucCmT0Ik=;
        b=cXfXevTlF89LWARS8DCM/YMjBBmR5STKTbvGYZgm1EJbdHbQx9tqsjQhCNbx1xWs0N
         c+6TJ+8MBDk8LacdrKV8DE0HXiPSfcVBG7jMr5ge3EUPciDGWTDdN88lfGl7iXMcUinD
         MBkxF0ceYgk2zIEMTNCRURTX631jCCWcMrmapWIF2xQLfuQppKbQF7/MSAJiMfi0/qqf
         k0zM757+Z6JpKe+SiKC3QIY8SXPXwCheDrfoysFPsuCKYLUcpfybHMylFNsV+87xmgmJ
         taXe3W+F3gfaKFrrjr9vnj1551nkH0cMcwVdExJxv8BMpi65ycUTyZxt7GQy5B5WaYde
         ADVw==
X-Forwarded-Encrypted: i=1; AJvYcCVccbgPg2XUSFDBfSiy65owjg9tYltwmRZ95TfwSRIHjsp1eq00p1F/hIfnKQbBCzWNSq/O0w//@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5X55CvDj8hP6lAZYgr+kSw+ksFQO9HZ4oOlj9ZwCF20Bciq/n
	D4srDjVOMFObWVhylYcTUh21/bnSpsX1P85QVCg4qMkda2L+g8ySpmCYe+ORMhtpVHndOyXOTl4
	CSwdFDriArVAzg3et0csR5bvjml0=
X-Gm-Gg: ASbGncu38TPy8ewYEXtjss6CGrUeBLkeiMNEpypDv5yhS6vp4L35+1IYpknD9DrYSOS
	mnr1K+3LPD7bcQLGf2w/lHDlSOxluxv7lw97T1yxhcsTiUl/LOidkLhugMPPzYugJKuSkd5/o
X-Google-Smtp-Source: AGHT+IFi42zHhjoXqgp2VJV5UD9ZMLdptjHa6YtswidMLbIEzZlA8M5+VHRc79Edc/ZpLIQv1bBz3S+cowB7tCn8awk=
X-Received: by 2002:a17:902:f685:b0:21f:dd1:8353 with SMTP id
 d9443c01a7336-2219ff393b1mr6017295ad.1.1740095084241; Thu, 20 Feb 2025
 15:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org>
In-Reply-To: <Z7bO1jT2onZFZwgH@infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Feb 2025 00:44:31 +0100
X-Gm-Features: AWEUYZmw8_u4Q_PaeJFgOsKd1yASO000wE_QBM8X9fEXhJh2_2pG9D73gOtuC4U
Message-ID: <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Christoph Hellwig <hch@infradead.org>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 7:42=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> The document claims no subsystem is forced to take Rust.  That's proven
> to be wrong by Linus.  And while you might not have known that when
> writing the document, you absolutely did when posting it to the list.
>
> That is a very dishonest way of communication.
>
> And while you might not have known that when
> writing the document, you absolutely did when posting it to the list.

I did know -- Linus told both of us in the private thread. I am not
sure what that has to do with anything.

As I told you in the previous reply, please read the next paragraph of
the document:

    Now, in the Kernel Maintainers Summit 2022, we asked for flexibility
    when the time comes that a major user of Rust in the kernel requires
    key APIs for which the maintainer may not be able to maintain Rust
    abstractions for it. This is the needed counterpart to the ability
    of maintainers to decide whether they want to allow Rust or not.

The point is that maintainers decide how to handle Rust (and some have
indeed rejected Rust), but that flexibility is needed if a maintainer
that owns a core API does not want Rust, because otherwise it blocks
everything, as is your case.

In summary: you were in that meeting, you own a core API, you do not
want Rust, you are blocking everything. So flexibility is needed. Thus
we asked you what can be done, how we can help, etc. You did not
accept other maintainers, did not want to have the code anywhere in
the tree, nor wanted to work on a compromise at all. You, in fact,
said "I will do everything I can do to stop this.". So that is not
providing flexibility, quite the opposite of it. So Linus eventually
had to make a decision to provide that flexibility.

I am not sure how that contradicts the document -- the document is
precisely talking about this situation.

By the way, I do not take lightly that you accuse me of dishonesty.

> Which given the binding creep means every single non-leaf subsystem
> eventually.

If Rust keeps growing in the kernel, then obviously more and more
non-leaf maintainers get affected.

But that just means more people is getting involved and more
subsystems are accepting Rust for their use cases. So that would just
mean it was, indeed, a good idea in the end.

> I'm not sure how that matters.  Of course your Rust testimonials are
> going to like it, otherwise you would not have quoted it.  They

Not at all. As I say in the talk, I included every single quote I got,
even up to the night before the keynote.

It is nevertheless very biased, because I asked people we interacted
with, which were mostly positive or neutral. I acknowledged this bias
in the talk too.

However, just so that others are aware, I did email others that are
negative about it too, such as you. And you did not reply.

> Well, obviously you do.  But as in many other things I would usually
> not count corporate pressure as a good thing.

Corporate pressure is not good. Corporate support is.

And we need that support to accomplish something like this.

Cheers,
Miguel

