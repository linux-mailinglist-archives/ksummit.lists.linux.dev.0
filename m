Return-Path: <ksummit+bounces-1916-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF70A46152
	for <lists@lfdr.de>; Wed, 26 Feb 2025 14:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA1B3AEED8
	for <lists@lfdr.de>; Wed, 26 Feb 2025 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C88021E0BC;
	Wed, 26 Feb 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMnMcHi/"
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385284A2B
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577981; cv=none; b=RiuWp4cNUrgkgGojDqKpwHd0FREBU38BrEzlNfLdeoXUjYvAfm3/b1gkjSNJOk949GdqfUGkRdmY321r0+vzGEAF7XPjHYnS9bGxslh3DutbbDXR/j9qTZ8R7Z0E4VuTynxL4n6T4JjAKhqbZQWR+6p756soLQgAkJW4A0QCrLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577981; c=relaxed/simple;
	bh=JIQw7BJUPcwv3MicIWTcVIfMUs8AGxVyXTCLAcwQkQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OthfjH/GJeP43ZkRdh6vYjyudvP9wbdgKOvJUQW9AcjlmsmEB7TZJhRkrTwpUzh0Jy8K9GaxFM26aOdPUojq7LmUpqWHhnDF1xpZRFwBlYrPQiIC7sRTlSrrAHuXbipaiFOBnlXJWRqdPi7fQIvFmnN8ZQnepzRA4KBkvBiPGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMnMcHi/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220d27d490dso16139475ad.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 05:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740577979; x=1741182779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQw7BJUPcwv3MicIWTcVIfMUs8AGxVyXTCLAcwQkQs=;
        b=lMnMcHi/Rk5zXkrSmmcmEpiXxCtB+xnRJGXDmQxw5aM2HLk2Ql3fX/haPlztLdNe66
         e01ybaNHwjqHanCp80Rq5E8g3NT49Ipmq+Vc2j1KKxZsj22PSlVPI7UeUNDvCprBSO3y
         i5vQKPTumLlWEJdG4E+R0Qz1i/XIhHoQnhz6ISCn5fh63lWacrLL8oU3TlvFny862Px8
         yw0IjiFtBYeNb+fkjie1ath+TWXca52EE7Y3F7QJLnT99LtVlYfUDD8aj4jOFMmICUIM
         FpWjPLR6dmhzAgcQtkxrLZymu5Q5o686n/mRk+wUtMjfTtcfwqp7k41RX74kZlXeXm1/
         4U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740577979; x=1741182779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIQw7BJUPcwv3MicIWTcVIfMUs8AGxVyXTCLAcwQkQs=;
        b=R47KQS1m0PtMZyI0sm+yoEEhvD9o2qvhi/bUNQchIkzzOVstNmPYPbKWlOddCA8JEN
         pKd3w8ry/iQtjMlJTqEL2j0+swGj9musGpg3f6lk0yoA1LkOGS9ZtJZfKNtCw5MDW+bU
         cP37+WxbGeJI76mptZl/asCkLypm6S7615Ef1G/SDyWxeD1tXOJl+m/aNaT3TxEXUXRu
         GMCgsTnY11shS65jhBu4RaezHQahPZmF8fWLXHyL2jtMGTp4NxgpAU9RaKC5q0cRbA36
         4sS2PESiHJ94FSoV3SLB4OQSddvg/fOd570xWIQviBYvjZgi8QPbPz5+uwpVSRPhSB8m
         ssog==
X-Forwarded-Encrypted: i=1; AJvYcCXnACf0Ih9XoAUEgWC2BjKFYYvULZwKKlqFMUw+KHI/AVDVSVhaSncur0MwzKu68QqsDMRTGqGe@lists.linux.dev
X-Gm-Message-State: AOJu0YzQpZNv9umZRRdPgxvRVnzW9DfvIOXpqS42cqZFBVBiB3c13+3/
	C71miaSe4tD4Ht+QcJHPVS7YDDUuRKeQjvXxoQMEEc5KPFsK2sa37DRBsEHR33+0Hz/Ne1sxTMF
	sCIs2yjfQeHxUlkKMRL7BTutfGNXsFGR6
X-Gm-Gg: ASbGncvQgh+6OFOZjfr3h+xkZvnJgaLj1yzPq7K4LAhKkLSH2CFUSbJR0uA3lAl39+8
	A5rOLmza1xiV4jm3rZvBihj01ARGf2ec9ObARS8RJKR9Cj0RsFfeczMtX5Ys0bZrIEiraMJ7nv1
	SYFFPlVKo=
X-Google-Smtp-Source: AGHT+IGyNP7dmuRW0tYnk3XLWBi3p+ESw1dXk4s/7QyJ5jvUAPUAW4M9pIGB3pYT1Jc+VKm/uOZMy3RV5rpaubS7JAw=
X-Received: by 2002:a17:903:230e:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-2219ff56b99mr134581255ad.6.1740577979041; Wed, 26 Feb 2025
 05:52:59 -0800 (PST)
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
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com> <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com>
In-Reply-To: <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Feb 2025 14:52:45 +0100
X-Gm-Features: AQ5f1Jrt6D-MHqK_yymi1qP2f2dLOB4ls7cibDYNXeHA2afziYghxadGGv1x-Sw
Message-ID: <CANiq72mA4Pbx1BeCZdg7Os3FtGkrwx6T8_+=+-=-o9+TOMv+EA@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:36=E2=80=AFPM Ventura Jack <venturajack85@gmail.c=
om> wrote:
>
> In a preprint paper, both stacked borrows and tree burrows are as
> far as I can tell described as having false positives.
>
> Are you sure that both stacked borrows and tree borrows are
> meant to be full models with no false positives and false negatives,
> and no uncertainty, if I understand you correctly? It should be
> noted that they are both works in progress.

I think you are mixing up two things: "a new model does not allow
every single unsafe code pattern out there" with "a new model, if
adopted, would still not be able to tell if something is UB or not".

> The aliasing rules being tied to a specific compiler backend,
> instead of a specification, might make it harder for other
> Rust compilers, like gccrs, to implement the same behavior for
> compiled programs, as what the sole major Rust compiler,
> rustc, has of behavior for compiled programs.

It is not "tied to a specific compiler backend". The reference (or
e.g. the standard library implementation, which you mentioned) may
mention LLVM, as well as other backends, but that does not imply the
final rules will (or need to) refer to the LLVM reference. And even if
a spec refers to a given revision of another spec (it is not
uncommon), that is different from being "tied to a specific compiler
backend".

Moreover, if it makes it easier, another compiler could always assume less.

> I am also skeptical of the apparent reliance on MIRI in the
> blog post and by some other Rust developers, since
> MiRI according to its own documentation cannot catch
> everything. It is better not to rely on a sanitizer for trying
> to figure out the correctness of a program. Sanitizers are
> useful for purposes like mitigation and debugging, not
> necessarily for determining correctness.

Please see the earlier reply from Ralf on this.

Cheers,
Miguel

