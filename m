Return-Path: <ksummit+bounces-2017-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96FFA49DE9
	for <lists@lfdr.de>; Fri, 28 Feb 2025 16:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1DD168AD9
	for <lists@lfdr.de>; Fri, 28 Feb 2025 15:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8990271269;
	Fri, 28 Feb 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjTuGIvw"
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAEC186E20
	for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757589; cv=none; b=f22EjLOg+rjWD3ZxSaH8bqoiGow/E4gUgkFruw+tG5O5TTkSq62Nz+FG5G1EGXKRCfPwa2q5Gy74XGHUx+1/lhLSdBR2SRBDZiQHpVdECUKhXsPQGUp+1pHvoZY516auptHci83T9RfFyga9+gDLKHLKsqwwlNrpu62QMcfTsi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757589; c=relaxed/simple;
	bh=93toOTzdlszPdXfBpILzqJNYhUGcnCo6bDJ01p3btH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoanQNtXFUAsSIS8YzcFxrPknQt28ZlY1ENZwhw0scaQgq/VK/gXNWr+vGzCBRNkMSUFQ8ktqf2bGz6jIcgGBOErRdK4KveyBm4YtLMyEtZTQu7Ze+HSgAfTZ6/o9AzjWYJ2qjf9HLoyPInDC5KkpkLdMK85jH+PH8iXPHddg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjTuGIvw; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ddcff5a823so19012936d6.0
        for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740757586; x=1741362386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JevkdLl+IvqRF4ouBtFMwmKyKELM3VPA3+3KL+J5nD4=;
        b=MjTuGIvw6droeJKsUCp1L8iX+/TAF2B0LdSWXKt5g8lHDqvH2TcNljrsAfyFKfpHqG
         lOLWudm1oBM0FGcwB2pZU8H7Ts+BtHsn2i5jkGbucR4ZiMEpAbtIf5t5a7IO/Y60fZJ7
         nCZ5PkFPMQWFWmLukagAQIwVUnEUnVg+jkRGqJ07BjCxC4qw+KzM3Kk8mA+ViSrKbYxC
         ZOe5sbrgsG+qd38y8uTGMdZa7A4bfXbzfGOy6RIqauTNjx5ETcODyGA1knxw++yVAmkE
         MmRAqmOE1HxRKZhM3DciIgpVm2WswtmdvSY1m/DzA2PLIgVf1w4FeF/wBUtVB9Dp9Xv/
         7x+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740757586; x=1741362386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JevkdLl+IvqRF4ouBtFMwmKyKELM3VPA3+3KL+J5nD4=;
        b=erQ6smnvapGDceThO3UNOVnBgyDnUlP3cAhDOFli4ihU8yvl758I9CYbBh6xnKbnSA
         yO7AnhLkw8IqQYbHTnmtNeCr1PhkPzDHqZMr0zMldPoLDSentAoDYcNESzbTFohiP1PN
         /A6J+VVOWs8wBW7F26qFbQguifsWLkzZu0ZaQw9pcwohS1ABZziFYGwT1JFKd0Q7uMkh
         Diola+mgSdIPH4xu13Zb0RhxBTkQyjJUDftBoam8MhB7ijgp2s/v9SPu/wpTETZG6iIf
         lvg8rv7tlJvaUsfHI2LeQvt26BTXjG7CdDJ2gREpSRWIlK9VS6JFVH+ccU9mBjAGpST1
         mTpA==
X-Forwarded-Encrypted: i=1; AJvYcCXV03NYorvwiTsn1zYSw7woLRGzm7CxOBRkWQMe/CKg4dmRZfmNw1HBoZe4Rbk7mk5/IF5XhQOb@lists.linux.dev
X-Gm-Message-State: AOJu0YyVkU1hPjETVpJZxHBdTZMptWDoYicqjSlu/xMOfmZLMH5NSsQi
	9DVf5G3HvcZ+ofllux/SGGEvUesoli3WOHiWZfABLX8AQ67E0BoJ
X-Gm-Gg: ASbGnctxYnWVEtrqrhgIbjD0Z0HCbCwRpyK/N4/YyLvfJgWul2dkX9qNnQg2olzn9nB
	ZTfh4YLXRPtKO8pqzOmilKCH67/WPesDMtflp3q5zFd4x0Y6NoK9zCaEoSihWGvM3UQoZ92kb6q
	nILmO+ACZFqDaxsXQkEDdwgRzi/lge60Rbm2IWF3+AYqs34Kq2sEQPIkH5JB8kwQPoX8ShH617b
	E0Tb16Lko4Jq31A4dIyr3aM/5oQu32CzmHfCXzQKlnFF8jSto3149HELt5/1tmSUJAPR7bcbuS+
	Y558jZaBBZmkaW4dv1y1AN5IX0Arcw7vdxO3aWtCmusLZcHUf2I9ho3Ie2rzfCb+YPNs1kAxApQ
	mpDon+0DqBjAw/RID
X-Google-Smtp-Source: AGHT+IGE6hF/EVT6SerT8YHInl7Zr7QacSOaIb/JKNpVEuaabbXatPIIhtmcsYOLxuyVqJ3hVwa+Pw==
X-Received: by 2002:a05:6214:2462:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6e8a0d84b69mr65479686d6.28.1740757586393;
        Fri, 28 Feb 2025 07:46:26 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ccbacsm23432136d6.93.2025.02.28.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:46:25 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 51EAD1200043;
	Fri, 28 Feb 2025 10:46:25 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 28 Feb 2025 10:46:25 -0500
X-ME-Sender: <xms:UdrBZw_ZDARev7pGErMo_0DXuYkEmR5gTozJqGPgCJIc1alkt2fhxg>
    <xme:UdrBZ4sBRqg-anLIYIR7Wm0cbKR_LR_R6K9TBJInUpoahorByA0NS4Na2isbuHKwa
    AUzII21EWj0c4A_gg>
X-ME-Received: <xmr:UdrBZ2DitXiyBf-lloMcO21klyujy1HrEj1APIRl3G9z1tggkg6mvnO-oQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvnhhtrdhovhgvrhhsthhrvggvtheslh
    hinhhugidruggvvhdprhgtphhtthhopehpohhsthesrhgrlhhfjhdruggvpdhrtghpthht
    ohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehtohhrvhgr
    lhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuhgvtg
    hkvghrsehtuhhgrhgriidrrghtpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepvhgvnhhtuhhrrghjrggtkhekheesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:UdrBZwcPNwSOPquwqf_86xR36wkA6giTK_l0fWwUuDJEaSJIRHp-xg>
    <xmx:UdrBZ1N0qWvFunHJE6BxERI2047gzAp8OtYLDB7KZ0_kYtGkpm4Kjw>
    <xmx:UdrBZ6m1E821DTNhjwC1oUwHPgDbGoiacMRAq2i6wDSqn8mS19pkJA>
    <xmx:UdrBZ3vAA3_wuY48KJuubyt8qDjc2kIPABZswGnWyrX2RpFyk4NIjA>
    <xmx:UdrBZztDnJdbCwm2kIJDAItmtwGfy0BN189C_dhP0nX5R4f_Z0JB24CX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Feb 2025 10:46:24 -0500 (EST)
Date: Fri, 28 Feb 2025 07:46:23 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ralf Jung <post@ralfj.de>, David Laight <david.laight.linux@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Martin Uecker <uecker@tugraz.at>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>,
	airlied@gmail.com, ej@inai.de, gregkh@linuxfoundation.org,
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <Z8HaT4X4ikQzAghu@Mac.home>
References: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home>
 <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home>
 <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
 <20250226173534.44b42190@gandalf.local.home>
 <20250227204722.653ce86b@pumpkin>
 <07acc636-75d9-4e4b-9e99-9a784d88e188@ralfj.de>
 <fbwwitktndx6vpkyhp5znkxmdfpforylvcmimyewel6mett2cw@i5yxaracpso2>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbwwitktndx6vpkyhp5znkxmdfpforylvcmimyewel6mett2cw@i5yxaracpso2>

On Fri, Feb 28, 2025 at 10:41:12AM -0500, Kent Overstreet wrote:
> On Fri, Feb 28, 2025 at 08:44:58AM +0100, Ralf Jung wrote:
> > Hi,
> > 
> > > > I guess you can sum this up to:
> > > > 
> > > >    The compiler should never assume it's safe to read a global more than the
> > > >    code specifies, but if the code reads a global more than once, it's fine
> > > >    to cache the multiple reads.
> > > > 
> > > > Same for writes, but I find WRITE_ONCE() used less often than READ_ONCE().
> > > > And when I do use it, it is more to prevent write tearing as you mentioned.
> > > 
> > > Except that (IIRC) it is actually valid for the compiler to write something
> > > entirely unrelated to a memory location before writing the expected value.
> > > (eg use it instead of stack for a register spill+reload.)
> > > Not gcc doesn't do that - but the standard lets it do it.
> > 
> > Whether the compiler is permitted to do that depends heavily on what exactly
> > the code looks like, so it's hard to discuss this in the abstract.
> > If inside some function, *all* writes to a given location are atomic (I
> > think that's what you call WRITE_ONCE?), then the compiler is *not* allowed
> > to invent any new writes to that memory. The compiler has to assume that
> > there might be concurrent reads from other threads, whose behavior could
> > change from the extra compiler-introduced writes. The spec (in C, C++, and
> > Rust) already works like that.
> > 
> > OTOH, the moment you do a single non-atomic write (i.e., a regular "*ptr =
> > val;" or memcpy or so), that is a signal to the compiler that there cannot
> > be any concurrent accesses happening at the moment, and therefore it can
> > (and likely will) introduce extra writes to that memory.
> 
> Is that how it really works?
> 
> I'd expect the atomic writes to have what we call "compiler barriers"
> before and after; IOW, the compiler can do whatever it wants with non

If the atomic writes are relaxed, they shouldn't have "compiler
barriers" before or after, e.g. our kernel atomics don't have such
compiler barriers. And WRITE_ONCE() is basically relaxed atomic writes.

Regards,
Boqun

> atomic writes, provided it doesn't cross those barriers.

