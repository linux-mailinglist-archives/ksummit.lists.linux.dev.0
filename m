Return-Path: <ksummit+bounces-1877-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42920A426E8
	for <lists@lfdr.de>; Mon, 24 Feb 2025 16:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1B43B0D74
	for <lists@lfdr.de>; Mon, 24 Feb 2025 15:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FAF25A648;
	Mon, 24 Feb 2025 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9m6C4SC"
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F325A624
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411842; cv=none; b=qzLUloU11VpV7Lv2WiCkMsEfMCI3L1+BgVMFP9Nq0yz8A/rVaZcmZQm9fC1XQNYnH+yNVDWRT4P8WupQ/rbM0qaya9zUVeSqCCqDeDhicz/eAxCzTx1+k6+lNaAquU2MrBS5JiyMfwNuAPtfuoyS6RAxEMEDLXvwPl3yMT/vOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411842; c=relaxed/simple;
	bh=axizuVZoqFdJlZVQmQhwpOvsd8I6FUTt/CSaw6hCKi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPI4xiQBcKJioxLhBESZvYQpAG10qBSplCwg3oWvfXhqRVYKwsTUJx2Ths7hPydWPTftVx6YUta0VkR/tLEC02VCJ47zMzICH1zOY5YcrkXxem7MWxN/ecpnss7AzXMk4k/wWxyEWfspBQ2+uwJW8vj+aqtqHHndnb3om39NB6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9m6C4SC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc317ea4b3so1285230a91.3
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740411840; x=1741016640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axizuVZoqFdJlZVQmQhwpOvsd8I6FUTt/CSaw6hCKi0=;
        b=L9m6C4SC7Y3MGp3bwU5Na+8v5uenmkzZJohqZmUBy+GDiiWH4L5Bl80BXZKajUMubf
         PC7Zd8Kbfb/SHq62G9v8TcAnW6bahst3CTc+YGHDEAF3h5/EaPsHgh4WDGl3pbYO30NJ
         ZxPJyKOdye+b1Cx+w3Y6d+SI7ct0ByThI7pNruUrsvmkKdSswfSdiJGFyu2M6zV8LM6a
         N9ky+AHKZJ6pkQ/umORaIPxWYNiDA/cwAIuCemeCY3UcqutJKCUC0ohPXw5bc4sygRFe
         BNz3h6oLh+yT/z6ibTNvzEVyo7I25cK1X3IioEHw0bK82ihwU/uhUUE8L1ykR3sK35Tq
         Ms2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740411840; x=1741016640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axizuVZoqFdJlZVQmQhwpOvsd8I6FUTt/CSaw6hCKi0=;
        b=wO0rlVYfr5OoYSKF4SycvPGeIMpw9T2B3MMJIhvru0iyd11uldW97rFizZAnJ4lhQO
         yiqgnykqfIESxHj/cy4J3kNBXuN5M4WXIMcyTcsgeFfRwXec/5mIK6k0Wy4GuOclcEqy
         3mDYjJVfjR1eo2FhKdRQoeHyms+jOjVkhTDCy9IqwPiIwWMFOuZjKyLUUOAZ1xKBuOpo
         rKPuiuGRYWustpJjcXIVFT8c7b5LSlLHzwOuST9l/XTNkC1R1IrVLIf0epdOgUxjjHeh
         p/P2uhhYGVHFdXl1YvUlDOcLgmks9gaFAgruDwlzGtdA51IPdobWSvAyPUmAJJ3bQJjP
         qi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAL5nkSxliR7NlanoIYohnEXoB75hJ3L7fvpcVUE2TMiD3bjIGGkSFvz4xPA3TNuS1c9AuNKLL@lists.linux.dev
X-Gm-Message-State: AOJu0YxEdq70ohCqiq3wtla+J/xukr6jvhd5MAdiUdx0Q3TGnG9j8vmu
	gy5hJngQFWeHOCq9lgFHx9bsM3rGMs0zclEiW4ggTvgnS1DxvmJSRcflTFgTYWYWryot3e1lSwY
	Be7rvree5zkFsc+D/Gc0BQXwUU5E=
X-Gm-Gg: ASbGncti01csxqf2/wVWtoChaCzLkSCOWCo9NuDlijltjQZ/94zTIvjrD0jVgN6rSZ+
	2vwAdv02S3iPOdcnF7QeAoTBjlv9SR0b0Ht3N6d3KlWg4u+CIy9mKbTWy1d9egTRhuWmVmgzXEH
	XQHc/JAxg=
X-Google-Smtp-Source: AGHT+IFwccVA735YcajFZZgRua28QRhXt3kkmuR2LYi+4BBuJGijedB8C1NxvHdYe2jYJY5Fv/jEa+P3KDPk5l1yvRc=
X-Received: by 2002:a17:90b:3907:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fce75f086bmr8812865a91.0.1740411840237; Mon, 24 Feb 2025
 07:44:00 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <20250224125805.GA5729@mit.edu>
In-Reply-To: <20250224125805.GA5729@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Feb 2025 16:43:46 +0100
X-Gm-Features: AWEUYZnJreLlUCqRvmxLmsng7Wps3b03pCHHq2EiNBIl5m7TmvKE7HVAH1sXkPM
Message-ID: <CANiq72kMQW6a991e9TgR39pmG5hVd-NcoeJANum4ap-6n=Mhhw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Ventura Jack <venturajack85@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 1:58=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> wrote=
:
>
> That being said, until Rust supports all of the platforms that the
> Linux kernel does has, it means that certain key abstractions can not
> be implemented in Rust --- unless we start using a GCC backend for
> Rust, or if we were to eject certain platforms from our supported
> list, such as m68k or PA-RISC....

By the way, the real constraint here is dropping C code that cannot be
replaced for all existing use cases. That, indeed, cannot happen.

But the "abstractions" (i.e. the Rust code that wraps C) themselves
can be implemented just fine, even if are only called by users under a
few architectures. That is what we are doing, after all.

Similarly, if the kernel were to allow alternative/parallel/duplicate
implementations of a core subsystem, then that would be technically
doable, since the key is not dropping the C code that users use today.
To be clear, I am not saying we do that, just trying to clarify that
the technical constraint is generally dropping C code that cannot be
replaced properly.

We also got the question about future subsystems a few times -- could
they be implemented in Rust without wrapping C? That would simplify
greatly some matters and reduce the amount of unsafe code. However, if
the code is supposed to be used by everybody, then that would make
some architectures second-class citizens, even if they do not have
users depending on that feature today, and thus it may be better to
wait until GCC gets to the right point before attempting something
like that.

That is my understanding, at least -- I hope that clarifies.

Cheers,
Miguel

