Return-Path: <ksummit+bounces-1826-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF612A40744
	for <lists@lfdr.de>; Sat, 22 Feb 2025 11:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 590E87A9957
	for <lists@lfdr.de>; Sat, 22 Feb 2025 10:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F651207DEF;
	Sat, 22 Feb 2025 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzKHnQmq"
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE30207673
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740218818; cv=none; b=vBvIBO0I5DkLL6Ixtug2qGIIRq8XK6bwoOtYMkCiNW9NYLsSfFek98N30CUKmZykYKZCvEE2RpbAtJpU2erNzPGK/Qoeq4uXI13QkCycz7f+oSTcI986HjiyIvBBVkacja2yizLLWTY+mBdBo4+AAbX9Z2IzYNQYyHZyR4DnR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740218818; c=relaxed/simple;
	bh=Ye3lcByRydkI6MhU/hDwevnB+P5HmWXYAchOg7ap9jU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NjfEV+pNEueJvM7ibI9NpaORh/UpCMOUQaGbx3feTgjHY9rAQ2An/47KF31E3tnH1Ec2JK3/zhhGFdZSSB27Rr3hHnySyL3G2mjNvSZjJWnmsRFmu5xNMzrgNKeROqp36M75EbPkBWL4Er5KBLBs1ETccOkwD+3NqyAL1rSIP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzKHnQmq; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so24020496d6.1
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 02:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740218816; x=1740823616; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ye3lcByRydkI6MhU/hDwevnB+P5HmWXYAchOg7ap9jU=;
        b=WzKHnQmqIOvrd5XXG5qMxR7rgHESwcKsRuAtMoYgP4d61wbYfqrjly7hOBd+d9YJDU
         /lcm1cgb2hEPcf4N0RtXRtU6d5wIYz96JZKxRVui3uFoy9mk1noqq1orVfjojPwVbsVA
         gGYbT76NGziiMZFGa+oWgWdcZSF9iGnIp6oDIsGiKc9Gv58fgsd8WePTY6MEzo4Bybhc
         tnNNtwVXEvBNxHGgXT2SUVwYncEbCNt6M1O0uwE0GViVGzb0e0fYcW2FjuSIYDoyB8nG
         t+9dh7dsQWKQr8H6/2Wgo8/sOxZS3U2pnoig16MYz2x/1VsLPE5ufH983WXIoEE4voLM
         evrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740218816; x=1740823616;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ye3lcByRydkI6MhU/hDwevnB+P5HmWXYAchOg7ap9jU=;
        b=VOq4PA/X9Iqnl1O21QEZ2ztvtZMPXyXlvR6D8SfKK+GlzXE1CmSzRqdD82s+v7wSk3
         8UTFZ91UU13VxKJ0T3SrtYAjP7DipZThIFeNZiroFdroYrCj0XeNeFld5FRi4OXS4wsK
         dzICVi/NBMRoAoNMgBrnp3EOz/jPwQIVb/foGHWby6kHfg2WpHSGMGDG/gNSY0BIzkay
         YdKUfGuVe8wV2EtTROuEsiZ4Phqh09ESIpypoqNLluknNkGEwbmAGm+o/RKxT2ylzuS1
         JSiCtVL8b4ILwgYqPZUOT84IW366j1f2uBs8AYqdpmvmJl+VgrIekchjiUpbdq6BfuyA
         BDkg==
X-Forwarded-Encrypted: i=1; AJvYcCXaivg+PW1V9hZOVv4AH7oPV5XK4nBVzahDafwuhr3+aT/5CYVPXjHmdmV6icKWRL7OpTR8vCUT@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ9hfsN8qczWC9lFiexDuSZBqVzoNWU4uXnz3iN13vEXZ6a/Oh
	GrzUqTsA4VKSjyvHSG+3nPYiJVTBY0mtk4AJlt6mpo7SNB6H1JQXERMLMD+w0PIpVmwcJKGUkP0
	TczhYq1V123MobxcCepxgCyLOg5Q=
X-Gm-Gg: ASbGnctoRJSdoy950krqSv7pBaIADWBAzUozslkVTE2tV6A+bmZSp4uL560MTmpJIZ1
	QbTgh/TMDLuzxnsm5/GbmifHQVCGTZalKD/76LI/pukUBoRZrTLYcy3EOBQBMNQzdrU+urzMAM6
	fuWxt7uJ03
X-Google-Smtp-Source: AGHT+IH02Q149aHdQepD/oWXJwQUocDgbC9g4NJXorOoPexq7v6Z6tci72orViVUo7+POtpXU3+avurlRJq6pu68x2E=
X-Received: by 2002:a05:6214:4009:b0:6e4:6f07:21a8 with SMTP id
 6a1803df08f44-6e6ae7c96f3mr77933706d6.9.1740218816155; Sat, 22 Feb 2025
 02:06:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ventura Jack <venturajack85@gmail.com>
Date: Sat, 22 Feb 2025 03:06:44 -0700
X-Gm-Features: AWEUYZnlJNy3plZj5-xeoqTD9CCS2zIkzS37rx2h8ySejSEw2Tn4Kkp_wxrwgfQ
Message-ID: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: torvalds@linux-foundation.org
Cc: airlied@gmail.com, boqun.feng@gmail.com, david.laight.linux@gmail.com, 
	ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>Gcc used to initialize it all, but as of gcc-15 it apparently says
>"Oh, the standard allows this crazy behavior, so we'll do it by
default".
>
>Yeah. People love to talk about "safe C", but compiler people have
>actively tried to make C unsafer for decades. The C standards
>committee has been complicit. I've ranted about the crazy C alias
>rules before.

Unsafe Rust actually has way stricter rules for aliasing than C. For
you and others who don't like C's aliasing, it may be best to avoid
unsafe Rust.

