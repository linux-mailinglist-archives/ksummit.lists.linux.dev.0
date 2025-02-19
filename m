Return-Path: <ksummit+bounces-1693-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 800AEA3B1F6
	for <lists@lfdr.de>; Wed, 19 Feb 2025 08:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE371896E99
	for <lists@lfdr.de>; Wed, 19 Feb 2025 07:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8941C07FA;
	Wed, 19 Feb 2025 07:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8dMMtQ5"
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB061BFDFC
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739948722; cv=none; b=l866UwWw+cVcil0+a9zop2aZ7w3uevASZ7ST7G4byKVF/ocF/7Q+vHm34L1GAzrOAouvLFAqml/sV7MOK/fpmGAH1tEiAswl3SG55IZVb3juQ62JyG02Amgp5I5ce3dhZqskD8LvDenRSxFkU/+IyLJQ092O9AnKGaq5Aw7U8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739948722; c=relaxed/simple;
	bh=FEqzqA1JniSzrQgsbCgTp05lnoy3SxHbt9/3jeLjZDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0SuqaYomzmJK1EBbmL8kJKoXy3kyVzo5AIzgc96FkmGFdcovDtlILUDaEkFHhidfspOcuX2qbzlJ7agDoO/xiQEiOl7T1IsLLQuGiOJwY4XXW2eSKzN/c2Abc6jOW4GwQpalMBKg/iZ2se7CcDqZS89sO8XtA6pSvhx9gpzr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8dMMtQ5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-471b5372730so81250931cf.1
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 23:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739948720; x=1740553520; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dpgoJ1SsdygRr/FpJ1lhm0fZp9b2UMRqLfRvgPfCdM=;
        b=T8dMMtQ5JHtdRDNcWOToUP8ppHNWu4cVWejamLwLlveTFMz3H/3Wi0KiBaJRF6vkO9
         kIvMEiqySQXJRn/ObH0imNuB7zcatNHSJyh1CnFmQj5bYUj+ofJXURrFsnnER3QJvhlw
         fCXhI8BxniktJy7CX2UtJynYCZBqV9Ou8dn96YzAl1/vcmgDEG4UZ+CfDMDL1BdLPuj7
         vcV2AtF0oGsUHNyAaBg+cm7Lc1xw9W4ejO2pIySb+494gsD5YodCrvg44vU1LzT6E2w6
         OlXE9S/yNjkXSZY3VA4/Em5t48tdtkXhoY1ZDccDJ3+HyxGH2Nq2ZInR5vb+1lGdNBsl
         PMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739948720; x=1740553520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dpgoJ1SsdygRr/FpJ1lhm0fZp9b2UMRqLfRvgPfCdM=;
        b=MGdnK9VER3V+IgXJ7kUI1fFcrkoXo9lcjDqnUgDEdjzYWBVMyUIU290aHwscWu3lW3
         bQHPJeYbnf9c41pA4AbIdqUlIxq2/JrLlZJPMsObqsK39elqUfHGeG/ATfff0f0I4N9i
         sD4WO+DzaO847zPkLRbCBcpTltXqFTwXsO5qG1dipCcE9XSfdwPguAzZ8Ec/jxFdGarU
         I9XlXocsQF3mYZG5fzb0mBUqYz3WMAk1BZREcGnltDeUTHC6QJCpPgmmj/m2uMz37zKC
         FvptlvChkNZHhg9k3X7L6dYikXUrdzihhi8FiHuYChib4iycfWK2+aX3saruxtbOeiBD
         y0hw==
X-Forwarded-Encrypted: i=1; AJvYcCVftuZBkaNmetPoKIK/AjHmIXTw1KlPlA9JVKcqmbOP4gGYaOu5FmSPB+LsXFTGNXZFykUhPd1a@lists.linux.dev
X-Gm-Message-State: AOJu0YynkkBnpEjwk0XhbZS088f5RPPRnefxOwYPDiKoAu5LDL6ZJP0b
	lzlPixnL6pfWE4qspkxqV6AKAwb6SDD9h/u0mbG6fIZRgSa1toek
X-Gm-Gg: ASbGncvYH5O7cRVYb1eLdxvbxxdJewOmjo3pLKBTsQIE/RU4nolhj0+EFlqUZICQMHx
	L3Mu5kyqO373i7PrFocyz0ZGE0Y+Pv/yMOG2ABUEFIWoCIqHUADhIf/38nvwxAneDHdBSW7l37n
	KelhXHVYFRtBjOga+USfKijoaO26wPvnNTi4txvmOjBR9hG4cW4pqr7Iy20s2TwPheRyzACuEQe
	b1UwvDvhcPIr3TJBhuqU4Fi8meYj5zs2FfFyzkKin7U2HlIeFua5X8p21bP9Y1LJ0vr1Env5YY1
	X28TJKaIoQVUZ5t75JquchdhEgSBQzGdKBwygON3VtnUaAlKVrN5WH6U67a0nEJYazcTnqNP12I
	l30KhLQ==
X-Google-Smtp-Source: AGHT+IEu/xVTjGPkhCSiQcN/p/y1POCQeyzFKs71dvKS8dTXpXC+2tdA2RpTNjwOMD7M3vkWDPzXYw==
X-Received: by 2002:a05:622a:59c6:b0:471:f5d8:5f56 with SMTP id d75a77b69052e-471f5d86142mr147882231cf.1.1739948719777;
        Tue, 18 Feb 2025 23:05:19 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47205063be2sm11789801cf.73.2025.02.18.23.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:05:19 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B7F721200043;
	Wed, 19 Feb 2025 02:05:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 19 Feb 2025 02:05:18 -0500
X-ME-Sender: <xms:roK1Z8C0MIONmz0qBttWukADNeAEySf-9pcOtCSX3dXvH1dPVJzs_Q>
    <xme:roK1Z-iRFwd_Lhs9bO_HZwEJv3e1tn1EYDJPo_eAnoeJRa31R_NYsXxlH49m0200A
    q46dpMn6N04L2JkZw>
X-ME-Received: <xmr:roK1Z_nnX9thhFC3mDhRfsV1wlx5d31kfjTK4a5Ll4IeTf-HNEFNVhFYkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifeehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdet
    heduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehjrghrkhhkoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgthhesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguoh
    hnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhig
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhi
    nhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmh
    grihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhsuhhmmhhitheslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:roK1Zyznrp4YrHTsb1XJFSyCEBnb0tTjE98T9y19GmWTgqr6quSvlw>
    <xmx:roK1ZxS6_TRKxgL5Mx_quixPNmAp04jUCz1_nQJQgJXOh05yogRXEw>
    <xmx:roK1Z9bOjOjTi97cg5Rc-u7_R77JX6UXsCVGloiMzbArvGUuzmIzFw>
    <xmx:roK1Z6TmrTnJWkiOnMfCosImrWJsuwozsmoKWYqu5sJ9nfiWUMWawA>
    <xmx:roK1Z7BYI6yyWzxSVYPoBmW_ZFVzv33uOCqHftUERnNAA3cD5okeEk43>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Feb 2025 02:05:18 -0500 (EST)
Date: Tue, 18 Feb 2025 23:05:16 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <Z7WCrA_bbWR6PQQG@Mac.home>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
 <36783d51be7576fcdbf8facc3c94193d78240816.camel@kernel.org>
 <4cbd3baf81ca3ff5e8c967b16fc13673d84139e8.camel@kernel.org>
 <e63089e15c6f4d19e77d2920d576e0134d8b7aa7.camel@kernel.org>
 <Z7T5_WGX_VXBby9k@boqun-archlinux>
 <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <615ce44fa528ad7be28ba518e14a970f04481078.camel@kernel.org>

On Wed, Feb 19, 2025 at 08:20:31AM +0200, Jarkko Sakkinen wrote:
> On Tue, 2025-02-18 at 13:22 -0800, Boqun Feng wrote:
> > FWIW, usually Rust code has doc tests allowing you to run it with
> > kunit,
> > see:
> > 
> > 	https://docs.kernel.org/rust/testing.html	
> 
> I know this document and this was what I used to compile DMA patches.
> Then I ended up into "no test, no go" state :-)
> 

Good to know, thanks for giving it a try!

> I put this is way. If that is enough, or perhaps combined with
> submitting-patches.rst, why this email thread exists?
> 
> > 
> > , I took a look at the DMA patches, there is one doc test, but
> > unfortunately it's only a function definition, i.e. it won't run
> > these
> > DMA bindings.
> > 
> > I agree that test payload should be provided, there must be something
> > mentioning this in Documentation/process/submitting-patches.rst
> > already?
> 
> Partly yes. This what was exactly what I was wondering when I read
> through the thread, i.e. why no one is speaking about tests :-)
> 

In my opinion, about testing, code style check, commit log, etc. Rust
patches should be the same as C patches, at least during my reviews, I
treat both the same. Therefore I wasn't clear about why you want
additional information about Rust patch only, or what you exactly
proposed to add into kernel documentation for Rust patch.

The policy documentation in this email clarifies some higher level
stuffs than patch submission and development, such as "How is Rust
introduced in a subsystem", this is for developers' information maybe
even before development work. And I agree with Miguel, if we want this
information in-tree, we can certainly do that.

Hope this can answer your question?

> > 
> > Regards,
> > Boqun
> 
> Thanks for responding, definitely not picking a fight here. I

Oh, I didn't think it was picking a fight, just not sure what you
exactly proposed, hence I had to ask.

> actually just wanted to help, and doing kernel QA is the best
> possible way to take the first baby steps on a new subsystem,

Agreed! Appreciate the help.

Regards,
Boqun

> and sort of area where I'm professional already as a kernel
> maintainer.
> 
> BR, Jarkko

