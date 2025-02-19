Return-Path: <ksummit+bounces-1697-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F47A3BE47
	for <lists@lfdr.de>; Wed, 19 Feb 2025 13:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CBC3169A84
	for <lists@lfdr.de>; Wed, 19 Feb 2025 12:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B9A1E0E08;
	Wed, 19 Feb 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbDp/inc"
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066C1C6FE3
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968650; cv=none; b=EeMCZyWkMP+ANGtd8bzbzIsNjVrn0qlOGp30J0a7lJvNT+tRlRU0a/eU3iIeHSUYrwBrxVcyvOa3VNQBWD6/+CgCJendABrrKCQExA5o8ZSxVkBmKpJa13fzr5QwwNrQrA5QlRTwbl1S6RRuhiZuDYQ+YwqpskE4hmcl1mCvoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968650; c=relaxed/simple;
	bh=E813glZGEIsjJKozV+8mvsfIKuE0KjS7+ddAIv9uWM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj+IjSPBonFUUn/7do1XrDp2AqNUOjQ/8jGNm9JYMlvHa42dAc9FNaGeiQXkvnxKK+6XxBxRAcC1lXqioEUMw2rvFPjkd1xvC3dL7PsFFSJRgpuT+2USD5tulWTdwKHNx5cqBCsbYknj7NugkurmBGEtcb0xkzXffYe56gtamrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbDp/inc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220c3e25658so14998665ad.1
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 04:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968648; x=1740573448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwBIlI1n79R/XlsUJ+sAd01jk9yBUFHSETkcNVTiiLc=;
        b=fbDp/incWBxRFiLasxY38lcdkn8mVf2UoZs+KPfADuHD7hab6VPUGzz4KWHDTiaqce
         7TXIwmCUuj/6xgA32DAYf7yS5BrmhUOFVGrDRrXBvVx2SuftsIb08wT2s8+rEWUzYnXc
         hOimvwcpQGtLvr4GKyVuHKaPYu/7hGh2bU576nYpJoOyRag+jV23c3zWzMvfcY8Cn3Dg
         aAiuXJnxmTjhd44w7SqhIn9hT6wNZoIg5BlwUDZtAP1wmfq8hwI+a9w9DuMXyfnwTzp3
         ApsYLeoV1jEAX5yxH0OWYwCCNxUZhFaS5fGqFgBpGUYgRq4ctOH7Bjj/YDrKsURULEyL
         fSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968648; x=1740573448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwBIlI1n79R/XlsUJ+sAd01jk9yBUFHSETkcNVTiiLc=;
        b=m6x4s0XL9tbEnJ6I4LX84L1TQVsRMPWEnisBvSLz+5sIsnEDXTZgR4bWfC515/baga
         QxTBOS6C6Na95WQTSTpEFUKzLOMGlkPxVyVUbrjLjZSYgoF/Q0h8hFecL5eP5JJROepr
         UpKq8nCL3xBras8+Qk3avatFAdPCQfsGAUl0JCJra5TnYivi6xwlfjJiDopDTPyiejPC
         tO3/b44ptStUIeyTqgInRJ/NB6Z6PJNDRJjV/bX1k7DWQc8Jb97CnkTdrftkyrRPgVO5
         8lZ3NxVtwsYodNt8ND55qRs9UTm/2ujipPZpcXdut7s/lKbgYA2U2wUS9ISHWhLqnKZe
         rXCg==
X-Forwarded-Encrypted: i=1; AJvYcCWlHfipcEtVGD7MF8zuqZEVZPIhtwQxrfgASGYaLADcrwq+hraYCFhkK0hoUaYyt40UwMbH+H1r@lists.linux.dev
X-Gm-Message-State: AOJu0YylmuxYNzyvBo3BpCH4r0CsFtvZYZGVJtb1mrplHQevpGAg+lMw
	9OMAyV1XyZxcRswRdfFNycR/NBPU9286NR3eAIMToFOsch3JIhj3I1DWcLyK390+KZdxWCZ6HjN
	dZKGP4iOr+M2tMHa6I76DcjYzHfw=
X-Gm-Gg: ASbGnctKvxvq9T+bEur3BBV5joPU213ktrOBaiODVZCVk+OrxMHkEpOMc6OnS9wCznb
	3fvUohgG3e5Gp+WAMb/2Eiv8U/XwSviIi4MVSjR0WhrARSthNMxbBY7kQSoj3VEQHiBcdd+u1
X-Google-Smtp-Source: AGHT+IHGuzdVoj4DUc0V6CPQAtNFQQa8+o/lS+AhLidpTfJOfRjd1JGY1VvdIdIPp56m5UyTVUurCp9a7A3Hqb4IYWc=
X-Received: by 2002:a17:902:cf0b:b0:215:3862:603a with SMTP id
 d9443c01a7336-2210406ab92mr115183515ad.10.1739968647833; Wed, 19 Feb 2025
 04:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
In-Reply-To: <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Feb 2025 13:37:15 +0100
X-Gm-Features: AWEUYZmONFRA2mgKmckBIb7dfp2PpDahkYzIqYDpp7AYTW7SX9Iq-XzBK6AJUKo
Message-ID: <CANiq72mtX08qvFHDdoiSKKAB4z6QyNz=WTcXY36JZzxs-JzhWw@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 2:00=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> So at this point Rust-only kernel code (other than experimental/staging)
> should be deferred to 2034 -- or later if the distributions not included
> in the "same" are considered important -- if Rust is being held to the
> same standard as C.

This paragraph does not really give a reason, apart from "to be like C".

Why should the kernel (and its users) wait until 2034 to take advantage of =
it?

And, even if there were a rule about "we need to be like C", you are
not mentioning that when Clang support was introduced, it only offered
a single release of support, and then they grew the window over time,
just like we are doing for Rust. And that was for *C*. Please let me
quote commit 3519c4d6e08e ("Documentation: add minimum clang/llvm
version"):

    Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
    small, supporting just one formal upstream release of LLVM for now.

    We can probably widen the support window of supported versions over
    time.  Also, note that LLVM's release process is different than GCC's.
    GCC tends to have 1 major release per year while releasing minor update=
s
    to the past 3 major versions.  LLVM tends to support one major release
    and one minor release every six months.

> Well, these cases predated 2024 and the 1.78 compiler you mentioned above=
.

Not sure what you mean, but I think we are agreeing, i.e. before we
established the minimum, we did not attempt to support several
versions (obviously).

> That is of course pushing the time line even further out.

If you mean that we cannot just drop C in core subsystems today, then
yes, that is correct.

But we can still add Rust code for quite a lot of useful things
meanwhile, such as Android and Asahi, which already work today.

The constraint is really "drop C code" here, not "adding Rust code" --
you could, in theory, keep C code around and duplicate it in Rust. The
kernel doesn't generally do that, though.

> You can't convert the *entire existing kernel code base* with a single
> patch set, most of which can be mechanically or semi-mechanically
> generated (think Coccinelle) while retaining the legibility and
> maintainability of the code (which is often the hard part of automatic
> code conversion.)

Compiling as C++ is fine, but to get to the real benefits of using
C++, you would still have to rework and redesign code.

And, even then, you would not be able to express what Rust allows and
thus you would not get memory safety.

In summary: in a different timeline, where Rust did not exist and
"Safe C++" were implemented by GCC and Clang, I could agree with you.

If you mean doing that on top of doing Rust, then that is yet another
discussion, but: you would need people to learn C++ and Rust, and it
would complicate interop with Rust substantially.

Cheers,
Miguel

