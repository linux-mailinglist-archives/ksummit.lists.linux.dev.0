Return-Path: <ksummit+bounces-2004-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3711A48A15
	for <lists@lfdr.de>; Thu, 27 Feb 2025 21:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F4157A64B2
	for <lists@lfdr.de>; Thu, 27 Feb 2025 20:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C26270ECB;
	Thu, 27 Feb 2025 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJQL9qc5"
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9F1DE4C8
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 20:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689248; cv=none; b=j0AtPv5lm89F2YmNvYKrfDZuQspSwncIUW0Pu84MolAOIixSMW7bbV0tC58uypeoJZsf/NeFSrviC5lOH3gR7A6OrWW0RTomaR52YSgs3fsTAh6HiVedC4ljaPCB2yeC1/cEvgCy/UXMEwaVH6iA0M1UC9CuwDqMm6c2kPx6dnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689248; c=relaxed/simple;
	bh=4Cz2YpoTHmPtHkOS68fh+sUr/fCWd1Ola9ZLsLZtMjk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZMNPp3g22jZZ/bf7avgQNDp/r69p3fxsUrGsAQk+UIaRBERI0SU9r6msswiI8uhnlhSMIeDZsn9Jv+uv5T5opikk9P8DiC5TSCeZroGJZcTScRWlJyh1uaMFTwxcNlc0vkqGNPBvfYtug/RjAFYs1xKwdoTX4SHPgNIvpLxxTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJQL9qc5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso9920655e9.0
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740689245; x=1741294045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQQPqcJQz5kC+gdnMR2nVLYPbdgKeZprBZgNoDqESvI=;
        b=eJQL9qc5SovXKtV2cHNsDJjsVVnLTwbSo6pH+1/tReMf6x2vNfQQwX/URinY3aMFm5
         tzuIzms3hm5tIKXOgHjx2i6kSTR2YKUS1dQhCCkBoZKMSWahP9X8yuHnNa63szyZLcuo
         vn5SsH2v/PWu2RgN/ydVdYZaZ1YH203SAyTBb9DjS2NbReDHEPYeQ/pIAmcME7BSQ356
         Qr6Jrn0mSq+AkpTv1xCNb7kXV1jBZNGgszlKPMcSYmDAgBoen1e4WbPHFKfTFp/T2H8l
         zfl3McJzixSAMoNCPs5sXcGw67vDOGJVF47sgvRZe/5a6BOjdrri+Ri/990JQ+dwXRIo
         MfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689245; x=1741294045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQQPqcJQz5kC+gdnMR2nVLYPbdgKeZprBZgNoDqESvI=;
        b=B3t2PB+43QFexhi0eSaI96CvW9ZlUzJAleq0EqOxaD5tPbXU5L+Hr0p5FI3KwAIzxg
         EhfzdUTxnoqqbAO5pF2u164KKk9R+b2tHp/9ehR0ukf7NOUo/3sgd0pFBo+ZpqapVzUS
         Sb9Z+z+4WZL8i2S/FFU4JmwSpRFtK82ef1Xmj/WO66LOhbIOkj5DBdGAfuRyUjPmorbF
         4VVdPrI8gWvZgoCmvolCXEQUFbO/TL680cN3k0ODG8XmGV7XQeDfWI4Di7nx6F6VQvpL
         hlvzbNVFO7rDv/CE8Y251oVcvW6ln2CWfsjwJGE0YhVN5C2IOV1Q1cOdkppJD/FvTsdS
         Eb3A==
X-Forwarded-Encrypted: i=1; AJvYcCXG2X/I8SL8hZefWI+FBgOvLECjpS3L8a3aMgEkSfHbY+utXUZL1h9WC76HCKymQslkiDAyWZBw@lists.linux.dev
X-Gm-Message-State: AOJu0YxzWQUF0RgJnOvoH7tW8WgqTBnjFeas2IZAJXUkGukfyKak/C5A
	7GB6ll7Kf0VJv34xjQQ4ynxYWvRz2ATCfdSB4PwNC+e6ULrf+trV
X-Gm-Gg: ASbGncsgW/LBRRO/7ZOf38VGEoIAEMhx6O9JjJCUibqlIZtbQSGBoW8mut0/VFb19B0
	JBokDlKqnX6PKaBNpwb6pGWQFma4VP6T0RFGZXqecVMTw0NHDuZ9+bM1S6AkHwFz9lvFaJlX5/s
	6XfQuarZihSncwAaza2cyqhVJUd4E4m8oFJxGqbWJuwUg8TtfWRazbVHivKpQw1Ix0xgfuhmg0Y
	9PZ4yvY3KwIbi0VWbhpd3tuWC1RCa3sn81cIAgD9G7p9V56Ms86lpMmVKts0GZz5ktjMh5onQ92
	oZtWZqaPskZ2dfyu7ZD7YbU/qXzZUbn8/FusqtsT517CerUW3tq+3D8V691EaO55
X-Google-Smtp-Source: AGHT+IELp/ltp2+Tc9OTbSKyIGmqwP78lBZ8wP6ARPo+Nb6Lsvnj4kNu47cm6JSoAPSU4T43nlym1A==
X-Received: by 2002:a05:600c:3506:b0:439:9828:c44b with SMTP id 5b1f17b1804b1-43ba6704220mr5378135e9.14.1740689244666;
        Thu, 27 Feb 2025 12:47:24 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58717esm65285695e9.33.2025.02.27.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:47:24 -0800 (PST)
Date: Thu, 27 Feb 2025 20:47:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Martin Uecker
 <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Ventura Jack
 <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com,
 ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250227204722.653ce86b@pumpkin>
In-Reply-To: <20250226173534.44b42190@gandalf.local.home>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
	<CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
	<CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
	<CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
	<CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
	<5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
	<CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
	<ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
	<CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
	<20250226162655.65ba4b51@gandalf.local.home>
	<CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
	<20250226165619.64998576@gandalf.local.home>
	<20250226171321.714f3b75@gandalf.local.home>
	<CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
	<20250226173534.44b42190@gandalf.local.home>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 17:35:34 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 26 Feb 2025 14:22:26 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > > But if I used:
> > >
> > >         if (global > 1000)
> > >                 goto out;
> > >         x = global;    
> > 
> > which can have the TUCTOU issue because 'global' is read twice.  
> 
> Correct, but if the variable had some other protection, like a lock held
> when this function was called, it is fine to do and the compiler may
> optimize it or not and still have the same result.
> 
> I guess you can sum this up to:
> 
>   The compiler should never assume it's safe to read a global more than the
>   code specifies, but if the code reads a global more than once, it's fine
>   to cache the multiple reads.
> 
> Same for writes, but I find WRITE_ONCE() used less often than READ_ONCE().
> And when I do use it, it is more to prevent write tearing as you mentioned.

Except that (IIRC) it is actually valid for the compiler to write something
entirely unrelated to a memory location before writing the expected value.
(eg use it instead of stack for a register spill+reload.)
Not gcc doesn't do that - but the standard lets it do it.

	David

> 
> -- Steve
> 


