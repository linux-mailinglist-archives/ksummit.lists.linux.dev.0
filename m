Return-Path: <ksummit+bounces-2008-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29710A48B49
	for <lists@lfdr.de>; Thu, 27 Feb 2025 23:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141983B55F2
	for <lists@lfdr.de>; Thu, 27 Feb 2025 22:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80339270EC8;
	Thu, 27 Feb 2025 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbNAhJTt"
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9226E968
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740694838; cv=none; b=bSiIzyaqlR4ZypnGh44XwWx4gF474W/DohOx/G6GAJH1c1IZPkH7dDiJtaNRr8byYN+r6YJOG4Qft8146C3IZdY8+N4KdXxKj/SU6UJXSJuZ3q0FYolvzziaHDV+MqjPoRLXwzQ+WgxKr7kN/dZGEZd781OrP7MquFuAWYXZKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740694838; c=relaxed/simple;
	bh=HMDvo7nca0IFV2djIVMP9TfMU1YDS9A4fyz5CGnL46g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T29JWuvKU7ED7x144qV3QWU0xFyDRwHHipF/6o5BK6JPvhUf0i26wjNGzMs4q6fjNa/lfcs+mlrvb9RuibtJ2n1FBAxmNX0CftjqmPMe4zt2+RReyLLLdlwHGzM7bhjfaQjIh4XCUTqp5Z4CBDoYGpJVU/YAYTR1dPm1oNCf0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbNAhJTt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f403edb4eso870737f8f.3
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 14:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740694835; x=1741299635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrMBhcvnNde1i07KOFR0r6p8VM2SE3/ilITXzHNVp4w=;
        b=VbNAhJTtu6Pog5XXf0XFw2AypAbscygoyFD+PeGNyAKZQP6yDKaGXgQkEn3doGFmOK
         o6uiV7JBkpChmoY7+w/8Q5vHUyo6IozdotCCOvpeA087RZR503W84C+U6Z59uRBvwYIA
         5kYx8REHldN/q7NeoYowHNsnS7IHVc7YAJaEX7HZ2FVL/jKxP4WGugWMV7/69u5uXqPU
         YdaGSb7Z29VZ0e9D+/HBpMU+yX+3cZBqeT1UbNFRFZrHPXr/4A70USvtR3WealZSBDoX
         leBRujC5bNEqBpdJHkk8iF2GZowWQMoPvY9wEwluZxYvyXg89hkAQVOYcfXfe5eaQAep
         Nu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740694835; x=1741299635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrMBhcvnNde1i07KOFR0r6p8VM2SE3/ilITXzHNVp4w=;
        b=BBOB5NUQSmRLceZ+k24PKQy13Fm5m1BPAxbjJchaBKAQZ0GPd0R0pMX75zUZO7FZWJ
         gVI9MylZ1ypbcPsJ01vcesfREUgGHW/agBNPFvm7jqWyjL4Q+mBbNDR1lY41plY6lbOO
         RNzqaBm572rmqA67Dfaldz/umdH3Wsaa+UBPi5aG6/i0EX1O/IGs3Mkf70Rk6Tu0nueq
         aKt0Fe32HADigK+K4gGoVMJq58P0H+eNygn1E7vdJNAcp3E28P0FNdHJNWq5LLWHbGuk
         +014V8YIPDKk+2YRPfjBeDZfvSVTHvUfNMGufVKPvEvdd3tUi/aL0AkaHzLduk2U60Iw
         ZCPg==
X-Forwarded-Encrypted: i=1; AJvYcCUMgwwlhMwnX6JNXg6lxzxTfn2ipAPxO0Vl0AwpbMB5rxRsHDSKdeoxXLY+Lb48HEUf6jcwApur@lists.linux.dev
X-Gm-Message-State: AOJu0YyXwmXTdgWR8oyAHU7ktAmv3OFoD0GRtkRhr4H0WOv1pLuUhEF+
	XWQttvWMlJNegnb7p50BpvWbBxqCPIr+weT8gL9Rsk1kSCg19cwp
X-Gm-Gg: ASbGncsZBwm3b87n88hGvdBu/7ZifLp6qhkx9viBhJUVA9QIGZ0wYbpU+I02PvZIrAd
	YWnz96FI6IggYdxRfwkDoxnUyr64cTTp3HcgQ5wIo4B42tSAfoOp2DpSrAO9X3ZgskWynwUMBGQ
	GZ0t2GCEUWiZ8Alsb6h7YrVzYq02WIlA8fgsfEPxOOI6WptptyzYACAMxitPN7MEvLFRjzi/6+1
	V86w2VDRo4ERI+txcvtUB83ZqhhOacKbeLVeAsVuJDov8R8v2A4Qu5cSJ2zuggp6VXRiN9fgXQ9
	guAwQNsLJw2cjQGiQHXr90cokvSUghJPelDPXMNWUE/+J6MHAj5tf4KMWERjULEW
X-Google-Smtp-Source: AGHT+IEaqnAUI9UG6zLvTdn8dszXRMwLgW2Zlu6WgMIs55bnF0eZzkoVW8qvrLxaNKmcJm1y5wML2A==
X-Received: by 2002:a5d:598d:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-390ec7c6adbmr630691f8f.8.1740694833583;
        Thu, 27 Feb 2025 14:20:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6739sm3221628f8f.22.2025.02.27.14.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 14:20:32 -0800 (PST)
Date: Thu, 27 Feb 2025 22:20:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Martin Uecker <uecker@tugraz.at>, Ralf
 Jung <post@ralfj.de>, Alice Ryhl <aliceryhl@google.com>, Ventura Jack
 <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com,
 ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250227222030.3fd32466@pumpkin>
In-Reply-To: <72bd8dc3-8a46-47b1-ac60-6b9b18b54f69@paulmck-laptop>
References: <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
	<ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
	<CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
	<20250226162655.65ba4b51@gandalf.local.home>
	<CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
	<20250226165619.64998576@gandalf.local.home>
	<20250226171321.714f3b75@gandalf.local.home>
	<CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
	<20250226173534.44b42190@gandalf.local.home>
	<20250227204722.653ce86b@pumpkin>
	<72bd8dc3-8a46-47b1-ac60-6b9b18b54f69@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 13:41:15 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Thu, Feb 27, 2025 at 08:47:22PM +0000, David Laight wrote:
> > On Wed, 26 Feb 2025 17:35:34 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >   
> > > On Wed, 26 Feb 2025 14:22:26 -0800
> > > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > >   
> > > > > But if I used:
> > > > >
> > > > >         if (global > 1000)
> > > > >                 goto out;
> > > > >         x = global;      
> > > > 
> > > > which can have the TUCTOU issue because 'global' is read twice.    
> > > 
> > > Correct, but if the variable had some other protection, like a lock held
> > > when this function was called, it is fine to do and the compiler may
> > > optimize it or not and still have the same result.
> > > 
> > > I guess you can sum this up to:
> > > 
> > >   The compiler should never assume it's safe to read a global more than the
> > >   code specifies, but if the code reads a global more than once, it's fine
> > >   to cache the multiple reads.
> > > 
> > > Same for writes, but I find WRITE_ONCE() used less often than READ_ONCE().
> > > And when I do use it, it is more to prevent write tearing as you mentioned.  
> > 
> > Except that (IIRC) it is actually valid for the compiler to write something
> > entirely unrelated to a memory location before writing the expected value.
> > (eg use it instead of stack for a register spill+reload.)
> > Not gcc doesn't do that - but the standard lets it do it.  
> 
> Or replace a write with a read, a check, and a write only if the read
> returns some other value than the one to be written.  Also not something
> I have seen, but something that the standard permits.

Or if you write code that does that, assume it can just to the write.
So dirtying a cache line.

	David

> 
> 							Thanx, Paul


