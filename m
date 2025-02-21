Return-Path: <ksummit+bounces-1784-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE43A3ED21
	for <lists@lfdr.de>; Fri, 21 Feb 2025 08:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4807B17E876
	for <lists@lfdr.de>; Fri, 21 Feb 2025 07:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF211FECCB;
	Fri, 21 Feb 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcOhSWgP"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA735979
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740121511; cv=none; b=Au806UnrEewOiXkY9cIyVDxWCjPD6wz4uTeL8vcrGab5dPffLlXFYzTGbgKnRC3aniWD2UFRRdIe+dNG5KTQadHMUwy64R07x7Ev9tDeRD/SOXVrDQApLAGH/apii+uHFilGIKxt3TGeWWjJWKpKwgPInMzdXdwV1dqSITu+55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740121511; c=relaxed/simple;
	bh=sl7zCBDomJhdG0gnHNMB5kkyU6PcHulXkuYhL3ng/6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhr7CMiQYHKV5Bbdhr/27NzRWtidrTsax3l8C0Bk5yqrHASUIHW2EG6EOE5o4iWQiVTVTslWuOq0IcugJLD5wCMQkXy38ZR6RvBZyKbFNIDFDs+OKFyL0BikCrf/SCORJU9GUb+TL7vZDJXhjlfbY0qEyfceLnryNWQZNHCb5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcOhSWgP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so3274367a12.2
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 23:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740121508; x=1740726308; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sl7zCBDomJhdG0gnHNMB5kkyU6PcHulXkuYhL3ng/6w=;
        b=JcOhSWgPAi05ulx9br3wIY00w8FY2RTHMuc/p+Q0otkco4XLEt3vx+HlNw/x6t4Lxf
         lVVA/ux5RG7oKZZ27s1Myh9xnkmYxf84bSv7UlvqJlI4x+yFbERnv/gH7yTiKHK2h3ux
         Og3tnS/kw6SfUmgOrr7dX7xODR7ldn1yJtlkhfl1F9d/yQhQ70krohREkWGc4TORBThS
         z0ivfY9JOrdh9ISOgLOSsXxJPjgHu7zDeBAtk0kxed5UEtI8sQmjPEXphOI+hbuUN8mS
         9oDbfzyu5+V6NkloxZvaFPMgB/PZTifYSti5KGwE4KtsWZvGjL3DUada0FsOSQrgiJw4
         KITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740121508; x=1740726308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sl7zCBDomJhdG0gnHNMB5kkyU6PcHulXkuYhL3ng/6w=;
        b=T8dcdLIJ6IExVFIu+1Ye7T/Gcy8hqjTsrNKdJJGWugvSKqxQ+yCYKsboprnG4zc5Xp
         nkUrsnhDqVuWUBQwATenHV8en5xS9UNM4iL9xPr/WMfMAN4wjARZxwoC64J73pD1Me1A
         mFNEN0nMsKZaJny0u6Vn/+INxtDUyGpwjLJBKiIoaMp6RGKFqiOdEXRAHfP8zw31EaxJ
         4sn73dafMnH2kLEq0i26iBqt29AlEWxSedoqu2qZpCD3uQYjgf0ogMR96q/Oyp8rz2VF
         HtB6ZZOANikwspGayb8Ldm7aoBdSSgw5t9AiPSGn/1hoUj99WQlDcs6cUkA+6i3in5yR
         RuvA==
X-Forwarded-Encrypted: i=1; AJvYcCWwvjP3Vh2yrQAsWjSI5xFZxhaa2lDgQCoq0SYq1h3KVp0Hiv9G1j+O3rvX4W1Tg9RqbQQcXiEc@lists.linux.dev
X-Gm-Message-State: AOJu0YxPwGeP/bszgqUdf7LZWYvEB57uhRotC4uGF1jmTxyWuv6Pk16F
	/89asfccvPwyMACIfZFwyXnoAgdiN6s1mEKBEmYvw6AiUa8NfCBOAfuH+nfqedjtmBXJKoeuyKP
	B1R0m/zAPqwSI/S4ihcNHpaswuwg=
X-Gm-Gg: ASbGncvYOVk983z/e+CiAh+TEWsrQdldJfc1Fiyps0RR2RkBAzfHc4Y6kbcxzR95e8E
	heKB35AVicT2tQQR+wZyxuO3FOln5Kho+Tq56+UdYq3XZ/fCukUAmohzCVz+0Dfg+hWFzRIbU7R
	ZSbC96tw==
X-Google-Smtp-Source: AGHT+IHOQbo+TvMcu4+X/+LIeByPRKMQIlrYI0AV8qGp1AuzuqpbQz1twMeHfEV8p9x5EVqT5UvJoJGtCx8O1rMKfvg=
X-Received: by 2002:a17:907:1c28:b0:ab7:462f:647f with SMTP id
 a640c23a62f3a-abc0da36418mr148564466b.25.1740121507765; Thu, 20 Feb 2025
 23:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025021954-flaccid-pucker-f7d9@gregkh> <20250221051909.37478-1-felipe.contreras@gmail.com>
 <Z7gQ3kSeCf7gY1i9@Mac.home> <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>
In-Reply-To: <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Feb 2025 17:04:55 +1000
X-Gm-Features: AWEUYZkbvphXlwFSnn15e6k57DAgnH-HQV5ZI0ER8aN1n4x5jMTuqqoaJo3XkBs
Message-ID: <CAPM=9ty9KWFE+AkHi5FDrb8=O5bzbVEroT2fx7jLG5JK6HZ+tg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, gregkh@linuxfoundation.org, hch@infradead.org, 
	hpa@zytor.com, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 15:59, Felipe Contreras
<felipe.contreras@gmail.com> wrote:
>
> Boqun Feng wrote:
> >
> > On Thu, Feb 20, 2025 at 11:19:09PM -0600, Felipe Contreras wrote:
> > > Greg KH wrote:
> > > > But for new code / drivers, writing them in rust where these types of
> > > > bugs just can't happen (or happen much much less) is a win for all of
> > > > us, why wouldn't we do this?
> > >
> > > *If* they can be written in Rust in the first place. You are skipping that
> > > very important precondition.
> >
> > Hmm.. there are multiple old/new drivers (not a complete list) already
> > in Rust:
>
> That is a black swan fallacy. Just because you've seen 4 white swans
> that doesn't mean all swans are white.
>
> > , so is there still a question that drivers can be written in Rust?
>
> I didn't say no driver can be written Rust, I questioned whether *all*
> drivers can be written in Rust.
>
> People are operating under that assumption, but it isn't necessarily true.

That doesn't make sense, like you could make a statement that not all
drivers could be written in C, but it would be trash, so why do you
think rust is different?

if you said 100% safe rust I'd agree, but that isn't the goal.

Dave.

