Return-Path: <ksummit+bounces-1887-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1EA44510
	for <lists@lfdr.de>; Tue, 25 Feb 2025 16:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B79860E27
	for <lists@lfdr.de>; Tue, 25 Feb 2025 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E416C854;
	Tue, 25 Feb 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cnk1d3Ak"
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB31547E3
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498938; cv=none; b=NHtr88DnZIEP88yAa5l7HFmflcB514W+hDFxji7YFOoK0QG89wlMoQ4BOQJtfbXr56ILr1S1wYnsCcqUtT1ZNtEgd3oWbqFJ23mqunEtKkP2vcFygJx4e6+A3k9qUuZmhbiFN7fnZzZW+NKShwZb29VwV/iHGa60MMUxVCXhoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498938; c=relaxed/simple;
	bh=hF55E3Ogdaye+n1B25dunM3ZcH5a1MODKctwDGX44zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dse1RyamhfUyQI95YcIK2J91Ww8fKQGNP9fxhdOL5gWfiEk+DEzZVUkRHZGw/HEEvuLL8qc7fbD30BqqNkRlndPCFg9/yjXELu8tjGSud67oynovEFWZ3m8OzkENitCxQrfIaQRCbZPWzU00CNS6Wbvn41cfJkdsRNf1plwkKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cnk1d3Ak; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-548878c6a5aso717033e87.3
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740498934; x=1741103734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYtfOCfJn94fEBqmGvRWVlaxHU+OZYFbnWLQkERMpAs=;
        b=Cnk1d3AkQoCava0RmYVh4NjsCYKbgI7K9LQTBDHQIGUgHSq2lMzhJ+SY8cLDtKSTuu
         kVRd/2vzXpyX8CDtk30dpQ9+V02esJxXUoeDeadvnMyC1N8C8o/MXXidEM1B9svTgufh
         M4W64/TH5wsAmYMMePj7yPSYr+JGiWyste0CCaPWu2nNTu5oX++05qnCntipnRAzxZW7
         F8mTfrrqGMcmdeDK3+jjCy9++WfU34ZWQqn3HykrnzRG/0xnc2AGW5YMXVAM2IZudvzu
         8BIZDHpHYWWIDN90WCYJfntaj99eEXOLoS/BBPATGilxUmxvp5o8ISvxS9weBvZ5JaZU
         QZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498934; x=1741103734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYtfOCfJn94fEBqmGvRWVlaxHU+OZYFbnWLQkERMpAs=;
        b=dvTudOoABPQWiXQG4CYKhW6ID1lI9ABt0uurZjg7jQlJnYQA5fNZP9Aj2qXXjbK/tU
         4fe3Nf90VglcL5fY7+4bpM9G3f++2do27k2LlPUYqSOUGql4Ui77FbO84Wq9OWTgRbEv
         Rp9Nar4kVZlRsEqaZqV/3nAo9LwAckvFXyA2LX0ZBz/3LsDAS7BuqUamzQf9DRovpBaK
         TnMDgD2Hk58WMpn+VoGkTJdtsNdsXdT9vnYk6MXO+bveJDtGZiI7lh5hvTvWSokDtKxe
         +kxIj8xR/wulJ3iTJIKh+d8fJ3XVNR3auos2ok1LsgRDteksJDPhruBUYieRINuid9My
         WKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoB7/RP5yLgePDql/fSXbsYnv3uii0H0bWA1jORtqLizNBb7iY5Kwpodw7KvTLD2mNPkByHksk@lists.linux.dev
X-Gm-Message-State: AOJu0YwSe0J12wiDkREWTbGH2zEcEGKODhFqpBByGad7BOl7Nf7n1duT
	a/08ppJJIIhaas2yIhpMawGhjqg3omzXdLeEG/N1VGDelMFQPXGO42gStJlGXDb4X6arHI4bgxK
	fRl2KIZRVnG9Lu/LnbpFjwODVaWM=
X-Gm-Gg: ASbGncvWUDsTLuc4BU3nJHkG53ZIiCNTW+f9062GemK6FlhwFhA8vCgQ/0O9wGb3iGS
	hXWcvk6jT9B89cdlxyrFxHfNur76qWCmuNKLY4RDahMhisxeyAtbClsRm5JJpnPXqw1IPu7jgWK
	X3awKRLeVF
X-Google-Smtp-Source: AGHT+IF1XkfIfVw93S//iXQZcDFEKgFYA4bobH6DISTDawZVVJXpjn6qpb44SESt5MeNgE2IlLKAbPORtJU5bR6NPu4=
X-Received: by 2002:a05:6512:1244:b0:545:ee3:f3cd with SMTP id
 2adb3069b0e04-5483912fd2dmr6541677e87.9.1740498934272; Tue, 25 Feb 2025
 07:55:34 -0800 (PST)
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
 <20250224125805.GA5729@mit.edu> <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
 <CANiq72mfQk_ViHJ9Y_rU0etS8XpORvZUNMc5m2iHL=pQDiVFSg@mail.gmail.com> <CAEvRbeo3QujuvRxjonhzqjQbO5e1_ut0LOSQsukH1T5vx=jzuw@mail.gmail.com>
In-Reply-To: <CAEvRbeo3QujuvRxjonhzqjQbO5e1_ut0LOSQsukH1T5vx=jzuw@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Tue, 25 Feb 2025 08:55:21 -0700
X-Gm-Features: AWEUYZmDhhkLGgYxVaKt3jmn1GKLW8pPr0j-020Xk3x2nzuZnts7KlvnLN4mpsc
Message-ID: <CAFJgqgS8u=HZ4kps=9iEcw4ra2ocLU5YL+=YNB3Vo9E+1jNnXg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Philip Herron <herron.philip@googlemail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, Antoni Boucher <bouanto@zoho.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 9:42=E2=80=AFAM Philip Herron
<herron.philip@googlemail.com> wrote:
> My 50 cents here is that gccrs is trying to follow rustc as a guide, and
> there are a lot of assumptions in libcore about the compiler, such as lan=
g
> items, that we need to follow in order to compile Rust code. [Omitted]
>
> Thanks
>
> --Phil

Is this snippet from the Rust standard library an example of one
of the assumptions about the compiler that the Rust standard library
makes? The code explicitly assumes that LLVM is the backend of
the compiler.

https://github.com/rust-lang/rust/blob/master/library/core/src/ffi/va_list.=
rs#L292-L301

        // FIXME: this should call `va_end`, but there's no clean way to
        // guarantee that `drop` always gets inlined into its caller,
        // so the `va_end` would get directly called from the same function=
 as
        // the corresponding `va_copy`. `man va_end` states that C
requires this,
        // and LLVM basically follows the C semantics, so we need to make s=
ure
        // that `va_end` is always called from the same function as `va_cop=
y`.
        // For more details, see https://github.com/rust-lang/rust/pull/596=
25
        // and https://llvm.org/docs/LangRef.html#llvm-va-end-intrinsic.
        //
        // This works for now, since `va_end` is a no-op on all
current LLVM targets.

How do you approach, or plan to approach, code like the above in gccrs?
Maybe make a fork of the Rust standard library that only replaces the
LLVM-dependent parts of the code? I do not know how widespread
LLVM-dependent code is in the Rust standard library, nor how
well-documented the dependence on LLVM typically is. In the above
case, it is well-documented.

Best, VJ.

