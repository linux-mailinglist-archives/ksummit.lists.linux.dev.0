Return-Path: <ksummit+bounces-1770-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A594A3E418
	for <lists@lfdr.de>; Thu, 20 Feb 2025 19:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6E81889ABA
	for <lists@lfdr.de>; Thu, 20 Feb 2025 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195A424BD05;
	Thu, 20 Feb 2025 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7KOLN30"
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01124BCF5
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740076848; cv=none; b=h42jyVk7Lm0nSmWttzo/pcg6fcEe7RxmSHGaSYzS7hotJo1iRFleAE/VauJPx3sTLtyKdc18pbmsE3Q9OfAFrB9rbXlkpy094gDi6Dib6kWk5hoBq0Otq165EgPAC6Kv7yh9XloACW2PpBN306XFDqkfi3d+mcPasXyuBGZi5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740076848; c=relaxed/simple;
	bh=E2DR+BJJfXCSeI1cfeXIx9bKllVF0rrNynMBB0GIgg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlR+OBExcUiECcGtGCQ5ojKxxY6Ce0F76tbGaOR8FUTtsnzOOF9mYeasEuzTaUrsGA3EFGb/kCgbp1fc1svS9AozEkB8rWBuCfKfbrmlksRDbcDgLSKmZvYObTh0OcXbEB7Nx0pZ3BtR6HymLPBHi+VSRNxuNDs0oDlNS1AAZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7KOLN30; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so9231255e9.3
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740076845; x=1740681645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpYiKzs73InvLQsXoENmuSiu34F9WT8BsmsAiGCuxQ=;
        b=f7KOLN30e3DmVZcWjhRjkkM/Wv5TVuem6hJye1uua7fBw5YvAw968f55eqzsOwBwTK
         SIsB0AOtom6g16YBI5Vnvh3ZPFm0ZYtI1viLWvh9dbH0x1e/sM6cQvmDSrTI/S4FXRFQ
         k2lGCYZV4wlULGJ9pxjO7QaAiVdZsQhz1hDfvhK3Df+khgMY2f3/CY81npIe00XPpDoq
         3U0wMOJnfwsssJbsq0PcUImUlMKgDsgj929AWQKN9vLfP5scPq9VoRFEHDYGPFk9IeAA
         IxqQktBKqq10Wct7RZ6hhc6KT6kNtJ9vSVxz/3Gi1gW0gawm2y7O24yYdzq4pBTIwENN
         KjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740076845; x=1740681645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpYiKzs73InvLQsXoENmuSiu34F9WT8BsmsAiGCuxQ=;
        b=mDkOxD0F8XyTPqwU1gfLe6/0pr/DCd177DNr3/LVcmrd08zscCulRzZfEp5PTGzCJN
         W4pLbm/0b60LlvcWdsyQ1pjM2Hft0aqYAR6H/FEdUAwyz1MKAzz9uPDtfuFIh3yCaGoD
         TIkNg1nO9RsBDyrr7gOM0wRqhzwlC2t9oyTGv4g2BAL8tlySCzEA4WuK717ar9K/shs4
         +cuR/WVPy4FqFVjdFV1Z1R4PbI6OAO7J0mkvPSQNGioDlX+itcsMRYSvyLHRBkLFSHJD
         6EDT+RnBLWDk8iOFU3gi0GsvRj8TiggvWPS5u9RKD6D9ISw0eLi+bX4ozFS27G/ll3+q
         U6fA==
X-Forwarded-Encrypted: i=1; AJvYcCWgtP5zNmOzsvgPZGUQzut+r1k2Er5oUf83KBpqMGVG4DzUSAQx0YrfkhO31m9spMFa56YRcwrd@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo+9OEZHqcgfYgEOSpjGlhrpY1+BQDwzrbSd4fgVuKgP/0sQyL
	U2k6wSXO0yj4CBgn2vObX0sMqgoeNccYtlmCH8nSebqxNbVpAVcqmyRSpoI2uAgvV1It9lzt0g4
	jMgHar4FOiNZ5Do3979uebpxphppkTWNB
X-Gm-Gg: ASbGnctiFNOvoWBAaG60rjrdAbmjhHoRBPSPylOyErM/Urnn58zDrF8hit682r4wG2R
	G5igDdTb8Xd9ylNZWIDXKwXPrwe8cNYrDWA1K1QVw93ZcGKDpuf20GIHne6Ph9tH2Dd4Sp1UzEG
	ouQb0qH4NphXvL
X-Google-Smtp-Source: AGHT+IHkfgnrV+BJNL4baF5nekJSwGBo3ZopJ8YNhxStsP2Hf7g6+UzEp276HXeTQtpo/E5x2POhhtXsLL4/gCTqORA=
X-Received: by 2002:adf:f3c9:0:b0:38f:2b59:3f78 with SMTP id
 ffacd0b85a97d-38f6f0ac5a3mr257914f8f.45.1740076844972; Thu, 20 Feb 2025
 10:40:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <45rpsr92-4416-9no4-8o26-r0998nr77nr8@xreary.bet>
 <Z7bMnpq1cUezsNDl@infradead.org>
In-Reply-To: <Z7bMnpq1cUezsNDl@infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 20 Feb 2025 10:40:32 -0800
X-Gm-Features: AWEUYZlQ2ngnBUpsPvZmt-IUjjrYChxu8xuPgnYSqjT2MUxJIeYsrj1qt7MyBZU
Message-ID: <CAADnVQ+cX_oH_0GcdYkixrMxyvwAKrvSnzx1uofD3BM2E+L6eg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Christoph Hellwig <hch@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 10:33=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Tue, Feb 18, 2025 at 06:36:55PM +0100, Jiri Kosina wrote:
> > > [2] The idea of drivers in eBPF as done by HID also really doesn't he=
lp
> > > with that as much as I like eBPF for some use cases
> >
> > I don't necessarily agree on this specific aspect, but what (at least t=
o
> > me personally) is the crucial point here -- if we at some point decide
> > that HID-eBPF is somehow potentially unhealthy for the project /
> > ecosystem, we can just drop it and convert the existing eBPF snippets t=
o a
> > proper simple HID bus drivers trivially (I'd even dare to say that to s=
ome
> > extent perhaps programatically).
>
> Well, Linus declared any bpf kfunc / helper program type change that
> breaks userspace as a no-go.  And such a change very much does.

Have to chime in into this rust thread to correct the facts.

See the doc:
https://github.com/torvalds/linux/blob/master/Documentation/bpf/kfuncs.rst#=
3-kfunc-lifecycle-expectations
TLDR:
"A kfunc will never have any hard stability guarantees. BPF APIs
cannot and will not ever hard-block a change in the kernel..."

git log proves the history of changing/removing kfuncs.

hid-bpf iself is another example of that policy.
It was redesigned from one way of hooking into hid core to
a completely different approach.
It may happen again, if necessary.

