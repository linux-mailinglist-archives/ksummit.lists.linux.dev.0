Return-Path: <ksummit+bounces-1929-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76999A46577
	for <lists@lfdr.de>; Wed, 26 Feb 2025 16:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F4E17C4CB
	for <lists@lfdr.de>; Wed, 26 Feb 2025 15:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4160C226CEE;
	Wed, 26 Feb 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geO1u8SC"
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B621D59C
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584464; cv=none; b=DSxFfwXJXZkP1tkYtBdn9+n1ElRkZNANtssxZPB17ezx+x27LFLB8hED26/90myG7zl9dFukLbML91rT62CxzoEzmUJenDTO5o633VvE9JiV09PLz2ojxFt6e562klUxSTH97ONPj/zugzvmkCg7xFXMDizzQagkELxjXz0SKws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584464; c=relaxed/simple;
	bh=uwWzBgOkEu6tAt9RlvyuB/XrCzVCtBuoCGy7bItgOXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5ivY3AjUHTiHAITxbVfvyrvENWFfNMwOlGFL48aRV5nAjYKi8tN9nGpI5Vny5ri5TMUbbvpN0jROVYkrYEYWrgvvpTLjvvjRTTMLtbIw2VxP+ZKSLRUdqxc4OsdQvox8lot69HiexyyU/fK3ofVmiSHWX+9ObfEMqC0zV/3/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geO1u8SC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso6482104e87.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 07:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740584461; x=1741189261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwWzBgOkEu6tAt9RlvyuB/XrCzVCtBuoCGy7bItgOXc=;
        b=geO1u8SCsUsYFsqpNOz576wuy7f4fvaKGYqWig/lWjP9Hd+6UG7nWFwFbNLH+3FpNl
         8RxxHhYoSrg7JQ20DznG+lvygm18YjkE9SrTr0rSzKaaGH0TQphAIxPZB0nqxToHjGsV
         nDUTLp6TZBA52svIsd8Z/YFIvuf+1tX/gQyWVvjaPfPf2RoW7TNAjlplMo7wFGfIOtCf
         0JKltK1NQ/EBqK7cZKLZdSFWZU9Fx02aX2fefT30g88r6MHOnEvfFSSyheERhU9taOqY
         VbGiDA/cLEuEJR2qkRQkc91bfg0XAV2fglfQ7+fDdrynyuTuoyh2TJMGvUM8zTrE7VmT
         P2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740584461; x=1741189261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwWzBgOkEu6tAt9RlvyuB/XrCzVCtBuoCGy7bItgOXc=;
        b=DoMKV/+d6MIkdKP2U0/GymajM+PpLyceVQuWnZeVNg6rX8t3mzXLkjh2ITrvQVeciB
         WEL6asOaXnfPT51Q6f7auGbMe7kZTzVodaogvuk8460mYjmqNeZQtK6MlIslxjuBpUzJ
         uR5JFJChUbkYGLMm5NyCNvG0lF9sURA/tgAzlPHBYudajtBXv88y0/738LpqCMCbCFfu
         HWL4AgwXp3x5DgT8QM4bPx4MbkgH/bdZ6zSpDq/RyB6S/fkKxbf/b6aHBZW+xLKbRQlN
         uE8j84zXh/peN4NeG/I2t1XRiAYontZPImpPdyw8l/AqhnH34HinkMkbr3JOCgjcsnaC
         RGPg==
X-Forwarded-Encrypted: i=1; AJvYcCVh4aj0Rtmhc4ljgEV9CqHJrxMITpaq+Zr9dM1hDDYbLkyTZNB7L9qe7SNB6JQJmWrccQ32s1NQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7/XecoKrdGbkJXvYaxKoNEW5akqr9HZleS7XdP457lxsHEx3C
	8quWvRrEvqBPmR0A79nyKznKcxWxKF6lEc/qHwaOvOUQCyMsaMGmoLxAhumYGvcqSD8XrueX0Pm
	NdNarF7xl9uvftY0BvHYAcx8rmoo=
X-Gm-Gg: ASbGncvCPZyVJBMRTqJLFVSgYdjiexHSTlqqgeujUUj8PTHYZarGFcK9RwAW/X6bdb4
	DLDzxDOlRSMTearWkXvf2v6VrcMMVQyln0CK6qTUN6n3h7IcltShOn0rBcpGIxpZTpGPxWrZv/k
	TkHyHA7wMG
X-Google-Smtp-Source: AGHT+IGWvtVF8xWWD8RBTOvu+8xeco4voQOBMX41WoZV9Ovk1e8nbIdwzOdsmKqOtELpZ+dTqQfiZ1hmxeZZjvkc79Q=
X-Received: by 2002:a05:6512:281b:b0:545:a2f:22b4 with SMTP id
 2adb3069b0e04-5493c5c0efemr2758222e87.40.1740584460979; Wed, 26 Feb 2025
 07:41:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com> <91dbba64-ade3-4e46-854e-87cd9ecaa689@ralfj.de>
In-Reply-To: <91dbba64-ade3-4e46-854e-87cd9ecaa689@ralfj.de>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 08:40:44 -0700
X-Gm-Features: AQ5f1JoXyOl8V4-EvSRgg4-KWz-YXXimRSHqSWOPiONotHcWRZZoZ5sJPppo77c
Message-ID: <CAFJgqgTTgy=yae68AE29oJQc7Bi+NvkgsrBtOkVUvRt1O0GzSQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 7:14=E2=80=AFAM Ralf Jung <post@ralfj.de> wrote:
>
> Hi all,
>
> > [Omitted]
> >
> > Are you sure that both stacked borrows and tree borrows are
> > meant to be full models with no false positives and false negatives,
> > and no uncertainty, if I understand you correctly?
>
> Speaking as an author of both models: yes. These models are candidates fo=
r the
> *definition* of which programs are correct and which are not. In that sen=
se,
> once adopted, the model *becomes* the baseline, and by definition has no =
false
> negative or false positives.

Thank you for the answer, that clarifies matters for me.

> [Omitted] (However, verification tools are
> in the works as well, and thanks to Miri we have a very good idea of what
> exactly it is that these tools have to check for.) [Omitted]

Verification as in static verification? That is some interesting and
exciting stuff if so.

Best, VJ.

