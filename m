Return-Path: <ksummit+bounces-1782-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E59A3EC3D
	for <lists@lfdr.de>; Fri, 21 Feb 2025 06:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF5F3A0120
	for <lists@lfdr.de>; Fri, 21 Feb 2025 05:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B451B1FBCBF;
	Fri, 21 Feb 2025 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQntuAYY"
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E74207F
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116196; cv=none; b=A9XNXaACDzycsHwFZ4IfZKk/tEbOoEDy82ZNUHQQiHVdW6j94lp3Y1ebPv2VQjGtwCGwvtGFYYsvWwbiwYdxwp7ngcUg3TnMPpAHGimJ6kNNJcuJFckJ+z8YnXrklrKQ0EYCZu3kPnFDyyTXkFlxfd6OFLbDdHDpy0eUWSmLXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116196; c=relaxed/simple;
	bh=oStcB3/2j22PjgCV1nSTPBHoQ6TNLZQZ/mIYOxpSPjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBiHE0q7s1LQQQvGjno5nW5a47NUhDyUbz32NynM6o94HbQmA1G7yD3ZlG2+e7q+xZj+AHteDZ4wMXSM43716TRBVMGs/VoXYPAVqu4ltAGVyrSPNWH0INQfonOWDrlMP48g7WOL8y1dTDRro9MIqB8YxEWbxBq0Zecf950ArnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQntuAYY; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e1b11859a7so8479656d6.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 21:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740116193; x=1740720993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkdd+8aLdRlmuPLS96GTxJJrr9x2D3DwB8vMZjyfWeY=;
        b=PQntuAYY2VeJ84oygNOcGwphWPaPbKMNvA2GHdNHojffsKrH4C4G3CKROZGlF99WLi
         17nXyKqqhfVXQ7QpHfbFybsYzcg7vLp1GLXov6sDmkyaTf9BQlQX4CxTIbIAwpzDNHE/
         3sofHHGLdC65q6WZg9KJCIQZAMIMYjG40PLqy+30nf/OziYZFTA63lzSj35OQurJ7rbM
         1v+6uCZ+zlhLeyer4DaGNEEahrItRgUS5M3BwbMV2N+KlhEShzQmS33Ej7mdEe+YiJtV
         fGj0jef1adeD83XKiN1T9+m87ew1eLfObVIJ7JR/YHWMcBFQ08HveXVLUrPWOX7HqTDv
         95CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740116193; x=1740720993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wkdd+8aLdRlmuPLS96GTxJJrr9x2D3DwB8vMZjyfWeY=;
        b=JTHuDMyh/1f4HUNwJ3QpqH4UWHh4N+fDEBrkgqbNLY047hm0v/rQBbcGhgJaor6iXL
         YueYvd01vFj3KW+/Q341jqqF0v+gut1RQT23kiSiq4s8z5Q5FVwrluZP1DU0Ke4l0VX7
         qeMtdyD0sXD/CEkJg7k4pTtCrlRFJHFrFWxyDXgPTID547di92etJKPkcoq/n/W8TXU7
         eJHOqNFDrj3rsQIZM2af3zIjVH98GGe2azsDgQGtX8VLpUtEmgYA/B2T8I4S0PZVVuJb
         3CSQx1zlzN1haB6GmcA3aJwa4TSGf41UYbMlmOeh2SkmIJjOdD9p7G9H7jecYP49XTP4
         DfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQakaHiW9tGiUcMEOHSWVr/bOBL6wfcYpTwJ0Q7kVpL/nw7AVurqUx1+3nVyac9mPiVrp+JbnV@lists.linux.dev
X-Gm-Message-State: AOJu0YzIVmdEsVjFznpqh6BFH3S6Xx3YqJVDX0BUDPa72QRXqq+HrbTW
	wb0o+7bMia2RG1A3O0iSkshoFxJuR56Jw7fH0RQ7+NXNCSI0hIA/BRlzkw==
X-Gm-Gg: ASbGncub3XBfJu8hJjsz62bz0kPr6gipMD3dkPq2sJvpYVqJhcZWZgkMSJggYGyXw9V
	3oMXhFprGBQuqFf45irCM00sxLhFpK1fCVZ3aiOeth9vtGEFfOldR8nfCnx8TV44uJCjEghm50a
	Xu/fSbnxd7YBs2tPng3r8ADio53r4dCDlJAhxLDuysXj+vOKLMhm1sSUUlQF2p/zO+ch3FG183u
	cJFIUdRZYohFbk7oetzb4QXuBGGEDtkZiXRpLTX8X6RIozqZVXzl3psTC47E9za4L7SUSHY2SHC
	QSkZRsynEWGvS43VZvB+WiWHrYS/JDKIIFGHggvQvsdqXfNuhSNIu1Z6YS0s0l7tyWZRw3c0PYs
	KikoKFmmDgyp7VhSq
X-Google-Smtp-Source: AGHT+IHsjhWGvoxLr79IKlUcyjrNloUqyJ4Y4mutrZNXf5334jKuRlB5nCk+VYIrOVwK3T6drm7M3Q==
X-Received: by 2002:a05:6214:29e8:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6e6ae995a51mr28365326d6.33.1740116193283;
        Thu, 20 Feb 2025 21:36:33 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0ae1032a4sm397488285a.49.2025.02.20.21.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:36:32 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 42B9C120006A;
	Fri, 21 Feb 2025 00:36:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 21 Feb 2025 00:36:32 -0500
X-ME-Sender: <xms:4BC4Z9xWdVU85h0MvzFjcNG6Z6KfPlSBzHblOly0KrU8AekJ9sEeMQ>
    <xme:4BC4Z9S_xfFq1k6HZXHYlw8kt0N60XUurxRCgPArB389WtSFUQGlL24nIK-N10CLq
    PL7GN4CeCKbmYuKyg>
X-ME-Received: <xmr:4BC4Z3V9W0K0MiGIY082IXqVwND9KVWRqT4askGgq4d8tOKals59NqbsDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiledvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepveeiueejgfdtteevveeivedugeevhfdvvdek
    ieevhffgjeegtdegvdfhkeevueefnecuffhomhgrihhnpehruhhsthdqfhhorhdqlhhinh
    hugidrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvge
    ehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhm
    sehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehfvghlihhpvgdrtghonhhtrhgvrhgrshesghhmrghilhdrtgho
    mhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgt
    hhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehhphgrseiihihtohhrrdgtoh
    hmpdhrtghpthhtohepkhhsuhhmmhhitheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:4BC4Z_j0atbqBRNWQlReDWVcIbRe0p5pPFRliISEDulZVZGllGpyKQ>
    <xmx:4BC4Z_DhhIS-iZSpZ8hipPL6c9wStIbIy6N6NuCldgXXeO7LZC0ZnQ>
    <xmx:4BC4Z4JvuLkVXRgjv_gnmghacYQC72MK2YHayxdj7AySaGVAB7qE0w>
    <xmx:4BC4Z-DXK8LfdP2INCgpox41AT589HsJLA3w6niUakEeIPh2_jt2qQ>
    <xmx:4BC4Zzz3zluis7UlXGLm9A5R7_6-VwDMM7WDFPXZu6-sNLRdIq85SeJg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Feb 2025 00:36:31 -0500 (EST)
Date: Thu, 20 Feb 2025 21:36:30 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: gregkh@linuxfoundation.org, airlied@gmail.com, hch@infradead.org,
	hpa@zytor.com, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: Rust kernel policy
Message-ID: <Z7gQ3kSeCf7gY1i9@Mac.home>
References: <2025021954-flaccid-pucker-f7d9@gregkh>
 <20250221051909.37478-1-felipe.contreras@gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221051909.37478-1-felipe.contreras@gmail.com>

On Thu, Feb 20, 2025 at 11:19:09PM -0600, Felipe Contreras wrote:
> Greg KH wrote:
> > But for new code / drivers, writing them in rust where these types of
> > bugs just can't happen (or happen much much less) is a win for all of
> > us, why wouldn't we do this?
> 
> *If* they can be written in Rust in the first place. You are skipping that
> very important precondition.
> 

Hmm.. there are multiple old/new drivers (not a complete list) already
in Rust:

* NVME: https://rust-for-linux.com/nvme-driver
* binder: https://rust-for-linux.com/android-binder-driver
* Puzzlefs: https://rust-for-linux.com/puzzlefs-filesystem-driver
* Apple AGX GPU driver: https://rust-for-linux.com/apple-agx-gpu-driver

, so is there still a question that drivers can be written in Rust?

Regards,
Boqun

> > Rust isn't a "silver bullet" that will solve all of our problems, but it
> > sure will help in a huge number of places, so for new stuff going
> > forward, why wouldn't we want that?
> 
[...]

