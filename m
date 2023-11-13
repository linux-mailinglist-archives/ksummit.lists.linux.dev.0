Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF67EA311
	for <lists@lfdr.de>; Mon, 13 Nov 2023 19:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48D9EB209B6
	for <lists@lfdr.de>; Mon, 13 Nov 2023 18:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DD5224C4;
	Mon, 13 Nov 2023 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AGXurPXj"
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309E22EEC
	for <ksummit@lists.linux.dev>; Mon, 13 Nov 2023 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c41e95efcbso704709566b.3
        for <ksummit@lists.linux.dev>; Mon, 13 Nov 2023 10:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1699901365; x=1700506165; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=98JjfbbMRLj65Pps1lgv/RdJWJ8zYnI6GVZdHxu3U60=;
        b=AGXurPXjE39iMO34coUFoI2vwXxH/QlXpIsVIwJOiThKSh49ld2LZ8TYUulCONkJHF
         6M+SYX63xWtAkfVXt4LJDj1ldYYkrrdqalvd9ZzBD0XZxnrl8O2shiROH4PBOQPg8tUM
         XZ082xXE3dpzeJkAe6tRvv2sZCyyEsVSxalqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901365; x=1700506165;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=98JjfbbMRLj65Pps1lgv/RdJWJ8zYnI6GVZdHxu3U60=;
        b=WTqb5jlfaAKRm+EAPDlsaapOsmO8ZXnhsbD9b+AIZCpNHI+Hrfhm/5fMZW05EziFBB
         KT4748eJkEaAbgBMm2zv327YI8MkJjY8encMazKs7PLNWWt/CuijPgUmsvZL3rO8q3b8
         lm2mPXjfQreX79dqIkwnWkaYNT2T8jB4ywvqIv8EqKtQXcWImZTaWeYJ+ShPfhwm3xKU
         OYB3QHiiOR4NTsgxBmEn6/5kiLAbKicNtbpmU9ckE1/DghCvFVFvKcFxKjb6qVglCCsm
         4qyf4hL84NeLyuhN8FjKAyhK+gf4Xv+xsMxLVcchZxyQf0ZR/6Q663VrJjlnLriHxzHY
         7dtA==
X-Gm-Message-State: AOJu0YyZwj3yAvY7a50vkQaEr8lqVuJ+I7GvE1JcdQUvK3pXVKngscnd
	cQmuuqlMMUiy+m58/XALWW8dQ7SSPEDLfy6xm6n7dX1y
X-Google-Smtp-Source: AGHT+IGn2wfjMAGet/s8aJjDA6YcwWFDZj6UcrxWdz6JT3+FEVdApMM6LOt7Ar7si3k4qv8N1CpCRQ==
X-Received: by 2002:a17:906:141b:b0:9e0:727a:e491 with SMTP id p27-20020a170906141b00b009e0727ae491mr4920400ejc.35.1699901364572;
        Mon, 13 Nov 2023 10:49:24 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906489800b009b2ba067b37sm4333122ejq.202.2023.11.13.10.49.24
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:49:24 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so7362310a12.3
        for <ksummit@lists.linux.dev>; Mon, 13 Nov 2023 10:49:24 -0800 (PST)
X-Received: by 2002:a05:6402:3483:b0:540:1bc0:65b2 with SMTP id
 v3-20020a056402348300b005401bc065b2mr6692404edc.10.1699901363732; Mon, 13 Nov
 2023 10:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Nov 2023 10:49:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=whGOUw=YDsPxd9o5M_JqcisE+TjcQQ-=SLYOnHd12D0Fw@mail.gmail.com>
Message-ID: <CAHk-=whGOUw=YDsPxd9o5M_JqcisE+TjcQQ-=SLYOnHd12D0Fw@mail.gmail.com>
Subject: [MAINTAINER SUMMIT] Prep?
To: ksummit@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

So it's entirely possible that I'm not on the right lists, so I
haven't seen an agenda for Thursday's maintainer summit yet.

But what happens every year is that one of the slots is the "how is it
working for Linus" thing, and every year I end up saying that it's
working well for *me*, and that the real question should be what the
pain points for *others* are.

So since my travel starts tomorrow (it turns out that Richmond is not
a lively transportation hub, and getting there from the West coast
takes most of the day and I didn't want to risk a lost connection and
not even make it in time), I thought I'd ask for some kind of prep for
that slot, assuming it's there.

And I'm not saying that I personally *am* one of the pain points, but
hey, I'm also not saying that it's impossible, so I'm also cc'ing Jon
explicitly in case he'd be willing to gather anonymous entries and
people feel uncomfortable emailing me about their issues. Now, I know
some of you definitely have no problem at all telling me I have
issues, but let's not assume that holds for everybody.

I didn't ask Jon before, so here goes: Jonathan?  Would you be willing
to take some input from people, and just scrub the names off it, and
forward some kind of word cloud of issues (or honestly, just the
otherwise unedited emails) to me? I think people see you as neutral
enough that nobody would worry about any collusion here... I'm not
asking for more than "a bullet point or two about what is a main
concern".

And hey, anybody who is comfortable with it - feel free to just email
me directly too.

But I would suggest *not* replying to the list, because what I don't
want to see is some kind of discussion of people *together*, but
literally hear *individual* concerns, to see what the problem points
on people's minds are (ie explicitly not some kind of "Oh, yeah,
that's a good point" reaction to what somebody else brought up).

Maybe nobody answers. Maybe there are no obvious patterns of
commonalities. And don't get me wrong - despite that "I hope you can
email Jon" thing, I'm not looking explicitly for "the problem is you,
Linus" comments, but just "what's the biggest issue(s) that annoys you
in the daily grind". Jon would hopefully be an option just for people
who are shy and want to be a bit more indirect about it.

On that "people who are shy" note: I do wish we could have less of a
"loud people talking" set of sessions. That was one of the comments
last year. I don't think any of us are really shrinking violets /
wallflowers, but we definitely have people who are more inclined to
talk over others than some others.

As one of the loud people myself, it's not been much of an issue for
me personally, but I think it would be good to have some kind of
moderation.

Anyway, that's my small attempt at having *some* prep for Thursday,

                   Linus

