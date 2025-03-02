Return-Path: <ksummit+bounces-2030-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F8A4B172
	for <lists@lfdr.de>; Sun,  2 Mar 2025 13:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2897916A8B9
	for <lists@lfdr.de>; Sun,  2 Mar 2025 12:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C39C1E32BE;
	Sun,  2 Mar 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf6Y7r/m"
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E531DF733
	for <ksummit@lists.linux.dev>; Sun,  2 Mar 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918003; cv=none; b=jSJSVFrnzUsrw2+pxQJaY7vP7e4j+H6Hh6l7jz/l9cOb71Kb7ogfdl8EdXvWtVExaAuQVf5zfqMtD2QEOxL9A27j1DqU9FiJFnm0Cd7Fi7Q7zO90AXKaBoaDAgjmBDmJ9YzsV7RpuPQZg4CF3jdq4eHuPwCVjMKqdeQtclFhN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918003; c=relaxed/simple;
	bh=ZrBbCj0ibZn0HW4gHwjyxqJOkO6cqMU6RSDZLyfOTyo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrrfhuROe15SPNPtoI7+AdOvegob15nch2aTxu/39UZz4fOgqSJC60YPpuQfSmqf3ZIsyfItiGG+FBc+fw0t1C7AIZPNUkgK8NhkqzHABelszfW0N5ypsh2497x04tZWGtvfnoc8vrDeiAVQLNa8C2qGWDSZk2GGtZelKuyZNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf6Y7r/m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4399deda38cso22655745e9.1
        for <ksummit@lists.linux.dev>; Sun, 02 Mar 2025 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740917999; x=1741522799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgCqjFsdmVPmkwwHKifVvYTCFuUFMQI0XhP4ZU/3jAA=;
        b=Vf6Y7r/mgxDxYTgupqDeHuZ44D8K/xdpmKWAn5bvf9HBHV0I4uKhAghD+ISbgqm5A6
         9iEkV4ls1giXJnuaerQ79xgXY0XF2Ear+hYItJ0lc9zLICL6eORHiCvZu5zVDk8YAP0V
         BX99SrcbUHPBOaEd/iQEqdx8GkzatlKkdOSeZ7UyLVGeEP0W5Anp1ytgSoB0DQecn7eJ
         RC02/WzI9eEcXjR1G/hYPNA4XeLV1U6+1iWPFy5meGrLA1KZnt0xabQ1lWEAKcMj8Iwi
         jC0Qwb7aFIrWutVUgFCTIjJSxGWC485Lm1P/j4oPNspzTVLtYmG2MT1j5bURFyJETDJc
         SJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740917999; x=1741522799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgCqjFsdmVPmkwwHKifVvYTCFuUFMQI0XhP4ZU/3jAA=;
        b=Lj1c5Yx0uhit7vbxs3rLDT0qa2oItCDlRg0JBjH+gtKVPH2nQpHCOo5ra5HpORz0LJ
         m8EleS72MBTA/exyvAuD2Xhfgu2xvcClsZ8D6C4t829+m8PD9C62pVs5H37InQcvWRa8
         k/tn0jD6vf9C/J+ul3hfFdw06nraEODTJ1cp9kGfNY0C6YsuiEwLSzvMXf+1fVwybDZ8
         RblaqEu9L+rfrcPC/lsrgsF8eqjvLl7pRpTEsErbvhWJGs3INEeZC1FfWbJF5iC0Ax20
         z27JdzsIms86QbDvNr8BL0YYQd4yc/7+N30STI+KSEEIIP1GV3n7eBvw0YB7DU6nDwFB
         29jA==
X-Forwarded-Encrypted: i=1; AJvYcCVFMKdmRnxpfo7jJVH20mOo8xzLw3VES55CJRth3vMS06FOXAmq8mi5ux3TZKy2S7i/7gcZkRU5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Lt49U/iBV4IN0UZ3OkUHIaHnMdlaSxOLkvFu9ppq2Rt1e4rU
	VJFLl2vUkw91OwKpWwmKsPAWy4ZE/czvgMdzCDOKwnduh+9iL0Yb
X-Gm-Gg: ASbGncuAVMDitc3jRqBbYB2pgqo7KKujsRxR9XAtIasXTdjS3ZeZtu4+MoHwmCWbXYV
	DaFKOozYgGbzOZsfRjw3MUgKvPO5yjocQkOeOdnKC4TPROwzuplTYtMoNIpVpDGzKMt868LkSDn
	yo0JR1Z5DUfZuv39prC61uq9qq+oeOCG8suBdQldpR/cewbUU8FId410RUgf0dgpxLdgRip9EKg
	AFm6uYLrI7DydMrVVGc8k/hAgb5GNuOgFQ0wVz5foljzntFmw2XSdfxgrKurMgV/z46DFyjU5gZ
	Dv77hNM3+lnbm82iIMxEnzNCD+cmqRxp3H8Bxx1PeQvaSYn4XmyrBqrpBKdMMlRFZb8kDQATlOU
	fIb5KaNA=
X-Google-Smtp-Source: AGHT+IH9JKVSqwCY7/dPDG8HlygkblxfEWt0EgMvbXyn+Sth5sEwgJ69CNPda359PKer/OXo7j7gpA==
X-Received: by 2002:a05:600c:a01:b0:439:9377:fa21 with SMTP id 5b1f17b1804b1-43ba6766be1mr76628105e9.19.1740917999301;
        Sun, 02 Mar 2025 04:19:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbfb7e280sm7560765e9.8.2025.03.02.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 04:19:58 -0800 (PST)
Date: Sun, 2 Mar 2025 12:19:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Greg KH
 <gregkh@linuxfoundation.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Ventura Jack <venturajack85@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alice Ryhl <aliceryhl@google.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 airlied@gmail.com, boqun.feng@gmail.com, hch@infradead.org,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>, Josh Poimboeuf
 <jpoimboe@redhat.com>
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250302121957.28f08504@pumpkin>
In-Reply-To: <20250226124733.10b4b5fa@gandalf.local.home>
References: <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
	<CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
	<CANiq72mOp0q1xgAHod1Y_mX86OESzdDsgSghtQCwe6iksNt-sA@mail.gmail.com>
	<f2bf76553c666178505cb9197659303a39faf7aa.camel@HansenPartnership.com>
	<2025022611-work-sandal-2759@gregkh>
	<16127450a24e9df8112a347fe5f6df9c9cca2926.camel@HansenPartnership.com>
	<20250226110033.53508cbf@gandalf.local.home>
	<9c443013493f8f380f9c4d51b1eeeb9d29b208a3.camel@HansenPartnership.com>
	<ylsffirqsrogli5fqlyhklhy6s54ngolvk5hj5fnpn3ceglyii@cgcvtm4ohtra>
	<20250226115726.27530000@gandalf.local.home>
	<olxh7iwz5yjuuqwpbzgohrl3dkcurbmzij3o2dbha5mtkr2ipn@wtee4jjj7ope>
	<20250226124733.10b4b5fa@gandalf.local.home>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 12:47:33 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 26 Feb 2025 12:41:30 -0500
> Kent Overstreet <kent.overstreet@linux.dev> wrote:
> 
> > It's been awhile since I've looked at one, I've been just automatically
> > switching back to frame pointers for awhile, but - I never saw
> > inaccurate backtraces, just failure to generate a backtrace - if memory
> > serves.  
> 
> OK, maybe if the bug was bad enough, it couldn't get access to the ORC
> tables for some reason. Not having a backtrace on crash is not as bad as
> incorrect back traces, as the former is happening when the system is dieing
> and live kernel patching doesn't help with that.

I bet to differ.
With no backtrace you have absolutely no idea what happened.
A list of 'code addresses on the stack' (named as such) can be enough
to determine the call sequence.
Although to be really helpful you need a hexdump of the actual stack
and the stack addresses of each 'code address'.

	David

