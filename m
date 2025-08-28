Return-Path: <ksummit+bounces-2236-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32C9B3A3D3
	for <lists@lfdr.de>; Thu, 28 Aug 2025 17:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80A50171020
	for <lists@lfdr.de>; Thu, 28 Aug 2025 15:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0B258EC0;
	Thu, 28 Aug 2025 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWyZIkXX"
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E924E4BD
	for <ksummit@lists.linux.dev>; Thu, 28 Aug 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393884; cv=none; b=os4eUxxEnWYLnQn/QdvrTXECzQvy4n848S4AUcNr6pAiH5lpx6ojubL/21mP/6PFLGzGu7u+7mgyit23lB8bVivoxvoryiil0lL2L1vNU8jLzBR1Rn2yDcJo0CYplR7uXZGIJ4zHmiCG14mIAH0mOvL4zAcd4RL/bi+FibiB9uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393884; c=relaxed/simple;
	bh=CZ1MgrlZ/Mutmq7ccTGwgPsYCdMoDQ88gWJIc28Gkjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5QNqzURYjALe9SVx32BtYNNL8MtE+Rygcyk5xmLPDILXc/+QPWaSmzyhqmhmITjBaLV8b03tBmMusF8BcfYCYWlYiyqS0mAiH4KuVoVeheWbFWTD/JjUf8cKt4t//DF5Ymo43RqmJ+lDhm5aAskazKSi/DcBiXxOxDAZ61Gwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWyZIkXX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afeceee8bb1so153625166b.3
        for <ksummit@lists.linux.dev>; Thu, 28 Aug 2025 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756393881; x=1756998681; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ1MgrlZ/Mutmq7ccTGwgPsYCdMoDQ88gWJIc28Gkjk=;
        b=DWyZIkXXNtstmMj/PFKRLxFxJPGs/jjy33QniyMYJY+ECX8JkVe3ZdSfTtxjK6DPPh
         ZCLmZImhr53QUa9peozWFQJBeYRNf1FqIatGicqyrFqB3GUlL8naZy7rsIbWdjZwWdJ4
         0HIXaxsc9gSM8Mzie2ElkityxubaWuViDWpKGDTrIrW7cexUX1obdut07woCae/foJpc
         z9BAz1iqx2A4SX47QXmdg2mYzZCBRMcxrzoqEsaAHx2PPu6/hST9OrAOs3+i3oncZgDJ
         hHKrNogc5StkO0zsc3RW9pxSQoRCM3HkcIU1WxEfBKoppEK/845X8UHwKbqCn2jPeDYj
         jPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393881; x=1756998681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZ1MgrlZ/Mutmq7ccTGwgPsYCdMoDQ88gWJIc28Gkjk=;
        b=Yupos0ExbFA0nbrcrWQMSkb7Q8bExTLpEH5XqEcLw8OLXXSpMkWkKkivPmXqp0trVh
         LKU84kOz8ktFtlFxJFRpuXtQGtWdNDTuguCnWGMMJ3UkgSVkd7acdSYdo+leNT2RKDV5
         KxSboB0A/sTZKvIgI3HDpT44nEB1qaA++pBlakpWNdP9Lt5RdAGxeD+97WzUTylAbVJf
         LYrNdC85GH+3K/GFcHfMt7iZLlgdfXTQnbd0SN/F4u7j02gHMO+GaNpGhS4dnR6n8kuH
         w1E0Cee/5otkTa+e7QGoc/+CHegMgIXYUaEYRUfX2ixQMIuZ5MC3NEBlaHI1t9QvaQ3v
         GqQg==
X-Forwarded-Encrypted: i=1; AJvYcCXUbrnF8VD8pkorrC5S9OlfXkf/bpn0eNMus0MNKWbYJSdcHXyiFa042I21pCw+l4CtxKOZAFJD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx60yhE1DaZ+AWjrDMu54TOVM30irOF1rCH548eJHYytQHI01fk
	C5pmOPiAVX0khWO7A23/z1hzuZ8TUzL/GhLBIRD1zGg3L6cpQUXbZoCQ8iDSZ/kG/QYOckR05SL
	iB/Y++ajLx5VHR+t0HTk1QjxiNpC98Eb0/0HGKqcsnjBsRy/9jBGBrOw=
X-Gm-Gg: ASbGncvLimfnLAvc3yokWhax3Tep9JoMgfnZo/OIRaFqm7yvWhdDfRtwo8mQu1gNW+X
	Rtt2nZJThjJyeIuuS5N9nOZ70CXm+RZQmMhSVyUX1sCbCo5DYqdYFCNEfzFSszkRLP3Q3NO5+IX
	4Ro1UxRsEXboJWwTqgYWt+tZRfQ8C6DUL1uDa2hCTI2Ax6sZNf5NIwVzweiWbk9fj3weLRDIdE6
	i2UrslyO4S2dxXXnJkP/SqRbj3JSv9S9KBi+xw=
X-Google-Smtp-Source: AGHT+IFEs7konsZoczwepvocks0UsX4TsQn6/luW4E4/g/JEAnBN229gz9GrPnqiKhYQHDmVZ0dSEdh7MQUrAzV9fXI=
X-Received: by 2002:a17:907:3e08:b0:af9:a5f8:2f34 with SMTP id
 a640c23a62f3a-afe2963b046mr2450458566b.53.1756393881127; Thu, 28 Aug 2025
 08:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet> <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
 <CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com>
 <CAL_JsqKqO2Qg6VnRaotQdfrfoo78Y8AA1AKQBrD_XVSEK2BMgA@mail.gmail.com> <CAHk-=whkAe8f4=ttQmZhtoKvGtCLhEA-oHwUEvQFftYAwfVwCA@mail.gmail.com>
In-Reply-To: <CAHk-=whkAe8f4=ttQmZhtoKvGtCLhEA-oHwUEvQFftYAwfVwCA@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 28 Aug 2025 17:11:09 +0200
X-Gm-Features: Ac12FXwbe80vL_HLNkL2s9I0dvJY3ZON1kgMLc3lU4oYMGwTaY5dMmTYupXnb0Y
Message-ID: <CACMJSevrym+yvkmNTXcavDG7Xi5wOrnYYunuMo4ZMP7ti-ve7Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rob Herring <robherring2@gmail.com>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 18:58, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> All I'm saying is that people who do new API's should either just
> accept that, or just convert between the two. None of this "deprecate"
> garbage. None of this "blame other developers because they use the old
> interface".
>

How about "let developers know, people are actively working to replace
this old, bad* API with a better alternative so at least don't
(unknowingly) sabotage their efforts"?

> That's the basic tenet here: if you are too lazy to convert all users,
> you also do not have the moral right to complain about - or expect -
> others not doing the work you didn't do for you.
>

That's just being mean for no reason. I already said it elsewhere in
this thread but let me reiterate: sometimes a new (surely not lazy)
developer shows up and wants to improve an already messy situation
(for instance: remove the cruft resulting from having two APIs that
could be unified with some effort). They may very well not be
responsible for the problem at all. Don't they have the moral right to
at least steer the subsequent development from others in the right
direction if they're willing to do the heavy lifting? No complaining
and no blaming: just advice on how to use a given subsystem. Like, I
don't know, telling user-space to not use sysctl() (the system call)
back in the day because it's bad and was replaced by the /proc/sys
alternative?

And what is it with this "all or nothing" approach? What if it's not
feasible (too many places to fix at once)? I'm not sure telling
someone who wants to improve 1% of the code-base that they "either fix
100% or go away" is a good approach. If the kernel looks better after
this hypothetical conversion, then isn't it worth supporting? Telling
users not to use a specific set of functions and instead go with a
different one isn't really a big issue, is it?

Bartosz

* - The API may have looked good when it was introduced but things
change and new use-cases come up. GPIO would have never needed the big
locking overhaul we did a couple cycles back, had we just kept only
supporting MMIO chips. But things do evolve...

