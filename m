Return-Path: <ksummit+bounces-2306-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05842B49E79
	for <lists@lfdr.de>; Tue,  9 Sep 2025 03:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DED1B253B6
	for <lists@lfdr.de>; Tue,  9 Sep 2025 01:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61503209F43;
	Tue,  9 Sep 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GE5/b0QQ"
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD933F3
	for <ksummit@lists.linux.dev>; Tue,  9 Sep 2025 01:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757379818; cv=none; b=I8c6y5AJlKnbeHbjjm5sia9bkQQb4aMz/uib7H6YI15E55S+JHLRoUbQLqcuw8myu1sNsfYzLFvtgVLqu9rkO5t/aWKHm6tCAD5Qguxvc8EVLF5piTPxt3RHaaNZf+Ks5o4PC4xWiJVBmmgCRqXjb11iyMNOgxmCtYvBefCiXL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757379818; c=relaxed/simple;
	bh=MIQ/OBzm7eEn916q97GkMDNL3Hq/8C+XTaF3XAZpTmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZmmqse96BQUjL/7A2ly4xhQCpap8BIqeDCXijuX6w82cyxNZ62e098NvSoaDlua1zLj5WM/J7fxfXK7Eoi4TPtIau3rfSgJoWjUUXK94rMfphF74S6NO17+ZwnRCASe0inyRDuaYK7iRLDJ10i9cEKsWU8TOyn9OnU/M+ELYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GE5/b0QQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-329e47dfa3eso4416963a91.1
        for <ksummit@lists.linux.dev>; Mon, 08 Sep 2025 18:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1757379816; x=1757984616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM9KBfzsk6cTJyTfWJdnU+u/oQZMfcSaYLf1pUcMFmE=;
        b=GE5/b0QQ/lSBEXuJwXE/6p2lV26Y+2S9uqAOeX4RMVEeE6TNuUshUrvndv0yDcW4OA
         6HRSnr9eO4JZDTVXevJB2nVeWNboLrSKRpIQilYea1jCC8pi2GBW905AMp5rpYk9B+Zz
         xfa0zmR4Kw07cOZgpEVTV4EI+cyPWrgRj+mRlZ3mQwW5XLu6+S827HUdDCrnfOHs3c8T
         LgP+AbDZJkXtNLUAOi3rNj5/WZmrbBOI8kiduLNEJ24if0IwVQAPRIUW9Frra9HA13Fe
         sDAZjEK2/P9S9Yl0rPygxk4//gOFrw2rGnkwQ0p9jacsjU6ujmnD0GJEypDWHRqWKFW9
         TcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757379816; x=1757984616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GM9KBfzsk6cTJyTfWJdnU+u/oQZMfcSaYLf1pUcMFmE=;
        b=sXEL6HEskVGxV7ZAGEKv+W+jI35umgzA9Dahesm+v8hAAcqWRXUoxw6Ju8erDOQBO8
         0R2GGiXbDuNT/rgBJRWoOgM7gvM2Cv1BfBWqBtRt0pvK60y+wludzljThM/fLyrfLh81
         /LBiJ7Q7H0cMq6KlY2qJSNrkidsOWfoHgke9TPU7vivcS5UoU6gHxqZtWiOWUAO9veY8
         HqqOaXVAbBtUXphGW6nxo+dlOVLrBGQM/igh4Aj8P7v4i8ZZP10PfLMHfDuzARVnn1Ze
         CBbUGQ2OkxevEh/VF8afPpsWRfXrDXWdF0v42QPOJy7pQt1BPKiHiurpR+w2kUqGSUur
         dbPA==
X-Forwarded-Encrypted: i=1; AJvYcCXPBO1WIU5i+yYJg1Mwnx+PZBQdKnDqEdihcfea2eyKjrZ0vH4lQWCw/7n68bkOBKgV4fLW65xE@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4UITEak+f2/7aBsvM8Sl1yEsTaQd1DzlyX58HwRKuwyPYnzee
	dDihhoTjYw46mqK7Ef4tY6z8Ir+t6fxi/JWlDV5w7qw5pkulzgrErkCDMHpu2DBzBsCXWPKBV6q
	WMTdlGwCrRbBh3lNddptSHLCzL1tjsstbkbq1YL0p
X-Gm-Gg: ASbGnctybWVkCh5V/S/WYsIUvOh9OJi2h6f3xMnL27g/YbCGo1KNWNaL8gEhi66b6Qe
	3frt1tIWzHzhOlUiG5ngHiI/i15eTc3ghxZV2P3EgR95HmZeISJpgY09d+p1L+mbDOTXFaHeZLD
	9LPpLQB4oj+3QzvKQZCQPVzkNTpSdPfkzfEHKnEBpzkL7tkdwWKGNG/y+mfRMPUZfYv8Y81SNpT
	2hfHmLbUWfAGtbaRA==
X-Google-Smtp-Source: AGHT+IGLKAnKxOwsEGe7yiwy0GxnHYubU+E1bnlTlzqAkq9tFjGlBzIKzO75BAcSPOa/M2kYx7mCc3UHRWSwDfMAf8M=
X-Received: by 2002:a17:90a:fc4c:b0:32d:17ce:49d5 with SMTP id
 98e67ed59e1d1-32d43f77183mr13412109a91.23.1757379816162; Mon, 08 Sep 2025
 18:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
 <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
 <20250908113934.1a31423a@gandalf.local.home> <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
 <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org>
In-Reply-To: <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 8 Sep 2025 21:03:24 -0400
X-Gm-Features: Ac12FXx_qJVRkQQKzqqYlwU0h-bUfcqMyRj_mNb72dnaNPOxoGHAQxIH4mhnzHg
Message-ID: <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Coly Li <colyli@fnnas.com>, Steven Rostedt <rostedt@goodmis.org>, Jan Kara <jack@suse.cz>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 7:23=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> On 9/8/25 8:42 AM, Coly Li wrote:
> >> 2025=E5=B9=B49=E6=9C=888=E6=97=A5 23:39=EF=BC=8CSteven Rostedt <rosted=
t@goodmis.org> =E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>>
> >>> I'm not really on program committee for either a Maintainers summit o=
r LPC
> >>> so take this just as a friendly advice from a bystander :)
> >>>
> >>
> >> As Jan has stated, this is a technical topic. But you can send it to t=
his
> >> list too. From Ted's original email:
> >>
> >>    Related to the Maintainer's Summit, the Kernel Summit is organized =
as
> >>    a track which is run in parallel with the other tracks at the Linux
> >>    Plumbers Conference (LPC), and is open to all registered attendees =
of
> >>    LPC.  The goal of the Kernel Summit track will be to provide a foru=
m
> >>    to discuss specific technical issues that would be easier to resolv=
e
> >>    in person than over e-mail.  The program committee will also consid=
er
> >>    "information sharing" topics if they are clearly of interest to the
> >>    wider development community (i.e., advanced training in topics that
> >>    would be useful to kernel developers).
> >>
> >>    To suggest a topic for the Kernel Summit, please do two things. by
> >>    September 10th, 2025. First, please send e-mail with a subject pref=
ix of
> >>    [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a s=
eparate
> >>    e-mail for each topic.
> >>
> >>    Secondly, please create a topic at the Linux Plumbers Conference
> >>    proposal submission site and target it to the Kernel Summit track:
> >>
> >>        https://lpc.events/event/19/abstracts
> >>
> >>    Please do both steps.  I'll try to notice if someone forgets one or
> >>    the other, but your chances of making sure your proposal gets the
> >>    necessary attention and consideration are maximized by submitting b=
oth
> >>    to the mailing list and the web site.
> >>
> >>
> >> The CfP is closing this Wednesday, so please submit it soon.
> >
> > Yes, I already submitted the CfP on https://lpc.events/event/19/abstrac=
ts and got the confirmation email.
> >
> > Also I resend another proposal email subjected with  [TECH TOPIC]  and =
almost identical message body.
> >
> > Thanks for the hint!
>
> Hi,
> I don't object to such a topic, but I thought that LSMs were the wave
> of the future for extended attributes or special capability handling.  ?

I can't say I'm familiar with the RichACL concept, but generally
speaking yes, the LSM framework exists as a way to implement access
control mechanisms beyond the traditional Linux access controls (other
things too, but those aren't really relevant here).

--=20
paul-moore.com

