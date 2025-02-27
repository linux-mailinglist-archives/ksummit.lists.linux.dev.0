Return-Path: <ksummit+bounces-1991-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E0A48722
	for <lists@lfdr.de>; Thu, 27 Feb 2025 18:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CC51699B8
	for <lists@lfdr.de>; Thu, 27 Feb 2025 17:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE001E833D;
	Thu, 27 Feb 2025 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbMJDU2S"
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C811DB361
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679147; cv=none; b=nExaziOY9CgfYsSAu9Xany+Q7OsxLHYZawFVMHzQlrGfa9xoGAUkoVkUYWJSLUHKFCyV7CsvjqevkMuRI6N1aJ8Sp1ui+oWHBXqGYw/20Pi5DiSQ7pLwR7+Ze7JxE7UDZF9Ybd6i1v7PGkIietHJZh+waQDU3Bd7xT/ioVr6aH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679147; c=relaxed/simple;
	bh=wFHypZ9aXeGy2H0u0DN/smAKx66S6IqcKlu7mbarYQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nga6EjgOqbFQ68IQK3XERsdFZFIaTJXueoiLlg1kYMA4M+U78oObhJ35H7cbG2lFMZhzIXCFnfLvxtsMUK0HrpGCsdPyjuBBJ+oOk0xPGkEpNYcasLOcawx8XuRPoyn3OLuLoP6M3WvPXWHIgbeMyZ0zQsQwl0VsJvTq790QryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbMJDU2S; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fe851fa123so324005a91.0
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 09:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679145; x=1741283945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFHypZ9aXeGy2H0u0DN/smAKx66S6IqcKlu7mbarYQM=;
        b=IbMJDU2SJ18Gs7EGosDfQ2MZfBAjMDA453X/NEwEkcDvlX+AhhbqIfvVgKX0323J+D
         j2xHA2rWnwZJaUTUzk7LGbcypiK0RxKS4N1Cgy5drT2B4J9A87I36tenfiLD6zeAZrRE
         q84Bll6l5uL5JIB7LWl8WGTkkRolSVQOQ5Iev7uJWcFKQnnlXNxXstt4iCSrGYTDATgi
         OvdElFll5Wa5EqmcBffBilb+UhEc5t0uFVUBFL2OEDtAQsSTj7xIR2Fm77C32wforQxA
         mMKWsiZFuGk3uvz+Jvi6R2VSPEVcr/onP59njifWdJZEezFMCIRONJqJtoInu8YbN3qU
         Y03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679145; x=1741283945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFHypZ9aXeGy2H0u0DN/smAKx66S6IqcKlu7mbarYQM=;
        b=RVlEj8tHMuTXzvT8235rGIeU0Ovs8n3j5It07DxthTgVo1QXR9tj926UXsZRDKKLqP
         K88PG1U+cN79Nti4fQUMmWozsmOR7LtmZhKg8ktXVnBcDDzEh16fn//rmzMXk/z+EtrL
         CtUcf2RRwJY0Qu2ZbuPt7FYoScvZ1HGuljmqf4VYcOGVs9sQP+vqBSg7TTzdfSIt6GDP
         1EHC6r4D4xV3VyAri/4XYYRR8FMXzJMEPePd9P/k7MbYbfsBei3XCy6zKIVrC0LeudFR
         /DXGWtcvu8/SJV1IXa8AU40EREGOqZT1VrcHo7IuX4u9ztgv+oMBDe8N8WgaztYyvgq6
         y63w==
X-Forwarded-Encrypted: i=1; AJvYcCVuI0EW6NXmO0OX9JGoX9ZrD7zObnjyjSRmZinGseeU8d/Npmv7Bx6JJ17q8S6pRXicYRiLdRM8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2QCQL7UEisVG6VT8k524S9/EhyJPVBCSrxksOUbq4gDKxBPEL
	5udvcFU07wPSn/xkqjQkzg1V0y298DP1eHXSVkVyiBtYbYfUd62+paO6TaOzjBm1Fr8cZXS8oqW
	3nQh+WUkPTqHl7BvI/bAxQbvlCTA=
X-Gm-Gg: ASbGncsw0JmK8BvmobbgFlbXlI2sl6g6/OF+ApP1IierBMR25Ay5hn5b1uR9EmOFHEW
	QIUnzIFZmWwyvsEIW7KfdpjxWovv1U4OHODV1yZuPEeAESaRQYWmWNCOv+XpX51Ude90bbHfuKa
	IVwpb0W2s=
X-Google-Smtp-Source: AGHT+IEKP0WngFhSFv5HXyTS5ELtJf8myg8BbfACuEnuDF4I0HhFrREvIFttA3H3voCU/rGm7SEmt3dcOQN+bg43agM=
X-Received: by 2002:a17:90b:4a48:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2febabedde2mr129657a91.4.1740679144947; Thu, 27 Feb 2025
 09:59:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
 <lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2>
 <780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de> <CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
 <f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de> <CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
 <7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de> <CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
In-Reply-To: <CAFJgqgS-S3ZbPfYsA-eJmCXHhMrzwaKW1-G+LegKJNqqGm31UQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Feb 2025 18:58:51 +0100
X-Gm-Features: AQ5f1Jr5x77fYUaMBG1Lz2wlsPD0ugqjQLLdlTB5193Be51NeSn-MP9LKAUdkwI
Message-ID: <CANiq72mw_zo4ai7QWD5eLN_oFXE1RVkotFsGS+f=6LRmJoHM7Q@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Ralf Jung <post@ralfj.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, torvalds@linux-foundation.org, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 6:34=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> I have seen some Rust proponents literally say that there is
> a specification for Rust, and that it is called rustc/LLVM.
> Though those specific individuals may not have been the
> most credible individuals.

These "Some say..." arguments are not really useful, to be honest.

> A fear I have is that there may be hidden reliance in
> multiple different ways on LLVM, as well as on rustc.
> Maybe even very deeply so. The complexity of Rust's
> type system and rustc's type system checking makes
> me more worried about this point. If there are hidden
> elements, they may turn out to be very difficult to fix,
> especially if they are discovered to be fundamental.

If you have concrete concerns (apart from the ones you already raised
so far which are not really applicable), please explain them.

Otherwise, this sounds a bit like an appeal to fear, sorry.

> You mention ossifying, but the more popular Rust becomes,
> the more painful breakage will be, and the less suited
> Rust will be as a research language.

Rust is not a research language -- I guess you may be including
features that are not promised to be stable, but that means even C
would a research language... :)

> Using Crater to test existing Rust projects with, as you
> mention later in your email, is an interesting and
> possibly very valuable approach, but I do not know
> its limitations and disadvantages. Some projects
> will be closed source, and thus will presumably
> not be checked, as I understand it.

Well, one advantage for open source ;)

> Does Crater run Rust for Linux and relevant Rust
> kernel code?

We do something better: every PR is required to build part of the Rust
kernel code in one config.

That does not even happen with either Clang or GCC (though the Clang
maintainer was open to a proposal when I talked to him about it).

Cheers,
Miguel

