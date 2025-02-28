Return-Path: <ksummit+bounces-2019-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A4DA49E68
	for <lists@lfdr.de>; Fri, 28 Feb 2025 17:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C32F189A5B5
	for <lists@lfdr.de>; Fri, 28 Feb 2025 16:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F171271818;
	Fri, 28 Feb 2025 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3RLzBw1"
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04552188CCA
	for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759194; cv=none; b=frlz4lyQVXLJirfIZfhMhBb28c2gh6EiC0lYD2BL09Eg/iT5WXVv58mecn/rbMMyn3cM7dH5vuddDP4JPoe1lVPaaHOmIOwN8szKfI1Y9SxGWmfklAVKo6aEw8/wajmtqGIrGGT4kIMt8+X3FbfXUD8Y0881guaRpx5HpOejyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759194; c=relaxed/simple;
	bh=aQbZFZw95EDnWnnm5Up2Iqn4SASjIZZz8iv12PkMVvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=livLmW2Tvrp81iSCOE/RSq9Rqh6blvp1NsmBgwIT5VMQg0grNPOnAd7HTEM9TxLwdzK6OlQQvJKJVDGCFCLi6FUOGoIMNZp5TuaskOhAxK7ssjmbeAxpO1AyzFC24QQlR1xR8WO3k6eQF15l6lDrO3pPEpyLDhXFWgXx5R5B0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3RLzBw1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0e135e953so179419785a.2
        for <ksummit@lists.linux.dev>; Fri, 28 Feb 2025 08:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740759192; x=1741363992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uDxNY+Uqq+02fq06XSBgP/6hyJZmqPGyV6kja8+czU=;
        b=Z3RLzBw1dVaYw1mIu2Y4rpVjcNYJGG/04/v4sAMWVyFOPXV1g8JLKizla3CNGlKDgZ
         jOElG+90dl4Vz5AG9B1EVAOMNNHUk/riRQByiaUGSP/VOYDBG3KA1Al8k4BDbFDapDuX
         P7oYTxAF1SZ7cssLXwr14dTxZT1FVx4GMPTQzcRDOvW8FdW4Kr5RfQIbVXBIfNJY9ZXA
         nXbqSF0Ndd0N6EAxTV0kOLn67nvdLqgOxSmn/E0FppEUo1dZG4OkgJGtpqDM1qSMUDj6
         EybpiZgT7E8TRHZDtnLh8TYeLbhs/P85Q87fq0daenh2Rw2KRyEqyUhc9R9rjOG0/IF2
         XPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759192; x=1741363992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uDxNY+Uqq+02fq06XSBgP/6hyJZmqPGyV6kja8+czU=;
        b=jdOfxnO/yN8AfP+LUimKknCTZFdRtAO3Ush0/licRA7vSUcIQYSXrhLbE6aYc1+IMu
         ajg7/yPdeCzHzMD7zNeDTDhwhW+K+2W+/majjkjn3xezTSp3JgrS2yC7h1kqQdj5UKQ+
         5eqdDHS2x7lnHSvwTcnYbksuDtWFIz6r3aCRlxBVut24sUW+o1wHrPqU9dGKlPFzzoT2
         pmQODqnA+s6TTaNGyCqFk0TnI3nm8UX9f9KGnIsJT77s4BAoPC2DVfWsU9RrygRFxmQi
         XGRuceyYe4ASMCTSoV39SO0SqEuWd6g/WaL/MJTaATrx0ON6hj5qaQkSyFzUn+vGAK8k
         q29w==
X-Forwarded-Encrypted: i=1; AJvYcCVQpW4ISQXsonGohpKuCIIBeALuXcb6wLkw4On12YvxrhI5nGdKpzyhB6XlTbPEMvI+sSPiefMh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjb9yVi/BHJqjFYbIz/tPizJSdTCGQD2sJN7vvlh0KkHJRPsfi
	+17YNJyjtubhTWZ0bsYfbruWmbx6TPc+4guLuIkMCO0ygR4F+o+D
X-Gm-Gg: ASbGncvVEjCuIMWwWgO5Nt96YgCxQQXT7mpn0Et9SOWdw/f5sZwB6D9hSvkTF+CAsQD
	9RyWxFXk5kq1A3QysgkgtDHU1vJ4xNV/nrxkBJIvxKHF8u4TWRfX8IYHxeNT6uP4GBqBZeDDm42
	y1/xDLujvrdKqE1IcPKc2oQCah5cXSqrOAud0jlWr+AyWhyPPChid1MgTRYDfh4UxC02SBZCGLp
	Bakhu0dWhlrmyUiJjuRLkklxg8JWFe6Awwef/F+lIPS2elvLTFiiN58RXghn2n+FlQo4iGINaHK
	p7c19DLWYma2hKp6gxoxdUCg2I5BiYhfwlQ8dQ6J470Ik0nKFtUMfH47obHfaVe4Sm4FfVI3o6Q
	jH+j6U3r1uM+HKujv
X-Google-Smtp-Source: AGHT+IFYQ5tDufmCV6JPils1aA5CgyD3jh43Ss63OcBP2BW8XCYdQrgrvlXVQ8ZgCMPfast1dCho8A==
X-Received: by 2002:a05:620a:8281:b0:7c3:9d34:7c8e with SMTP id af79cd13be357-7c39d347e6fmr438960485a.55.1740759191773;
        Fri, 28 Feb 2025 08:13:11 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378dad24asm261910485a.107.2025.02.28.08.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:13:11 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B54BB1200068;
	Fri, 28 Feb 2025 11:13:10 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 28 Feb 2025 11:13:10 -0500
X-ME-Sender: <xms:luDBZ7N2krPLAj6KEEuvSUyp_ELkJlv1IPwcZvsPYZBYyrOnrJCwgQ>
    <xme:luDBZ194-_q6pQuCRkkmiRVN-egzxb03Va6DBw8aVUeEaB5nw3M4sPhR_6gJEl1k9
    2z1Luhy8eiNDtMGUw>
X-ME-Received: <xmr:luDBZ6TyKxy9EkBaPJkGIgWzSPmNjwJSzKjepHPkiVg9mGcb1UE4Wkaq5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdekgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:luDBZ_sTyaYAAUlFB5JJn6L-PGd3fHqWRwxp8gP6IML3E8L_-Qow2Q>
    <xmx:luDBZzfIOP1HgagwsH9sJGxuK_iG551P2RhSuNR5EBj72TDRB23DcQ>
    <xmx:luDBZ71FqZpvxTRa8v5EMsM6wuWU8wVt-3ootBya-gma4t_jF2AMMQ>
    <xmx:luDBZ_8QlJGtq-siq3g32d-sfhwmAEqZ-K6HyoDXXFE-QPJgKgYUfw>
    <xmx:luDBZ28jFdmS9EVSpQe0nMUF14hMl1zhvaVFMHQc_YXkqYoUNUwCkg3j>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Feb 2025 11:13:10 -0500 (EST)
Date: Fri, 28 Feb 2025 08:13:09 -0800
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
Message-ID: <Z8HglTh3EKO63lmu@Mac.home>
References: <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home>
 <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
 <20250226173534.44b42190@gandalf.local.home>
 <20250227204722.653ce86b@pumpkin>
 <07acc636-75d9-4e4b-9e99-9a784d88e188@ralfj.de>
 <fbwwitktndx6vpkyhp5znkxmdfpforylvcmimyewel6mett2cw@i5yxaracpso2>
 <Z8HaT4X4ikQzAghu@Mac.home>
 <vvtxa4jjk2wy7q6wnnxxgidopfd3pzxgntuehsu4skex24x5ml@yejfkrtg5dqc>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vvtxa4jjk2wy7q6wnnxxgidopfd3pzxgntuehsu4skex24x5ml@yejfkrtg5dqc>

On Fri, Feb 28, 2025 at 11:04:28AM -0500, Kent Overstreet wrote:
> On Fri, Feb 28, 2025 at 07:46:23AM -0800, Boqun Feng wrote:
> > On Fri, Feb 28, 2025 at 10:41:12AM -0500, Kent Overstreet wrote:
> > > On Fri, Feb 28, 2025 at 08:44:58AM +0100, Ralf Jung wrote:
> > > > Hi,
> > > > 
> > > > > > I guess you can sum this up to:
> > > > > > 
> > > > > >    The compiler should never assume it's safe to read a global more than the
> > > > > >    code specifies, but if the code reads a global more than once, it's fine
> > > > > >    to cache the multiple reads.
> > > > > > 
> > > > > > Same for writes, but I find WRITE_ONCE() used less often than READ_ONCE().
> > > > > > And when I do use it, it is more to prevent write tearing as you mentioned.
> > > > > 
> > > > > Except that (IIRC) it is actually valid for the compiler to write something
> > > > > entirely unrelated to a memory location before writing the expected value.
> > > > > (eg use it instead of stack for a register spill+reload.)
> > > > > Not gcc doesn't do that - but the standard lets it do it.
> > > > 
> > > > Whether the compiler is permitted to do that depends heavily on what exactly
> > > > the code looks like, so it's hard to discuss this in the abstract.
> > > > If inside some function, *all* writes to a given location are atomic (I
> > > > think that's what you call WRITE_ONCE?), then the compiler is *not* allowed
> > > > to invent any new writes to that memory. The compiler has to assume that
> > > > there might be concurrent reads from other threads, whose behavior could
> > > > change from the extra compiler-introduced writes. The spec (in C, C++, and
> > > > Rust) already works like that.
> > > > 
> > > > OTOH, the moment you do a single non-atomic write (i.e., a regular "*ptr =
> > > > val;" or memcpy or so), that is a signal to the compiler that there cannot
> > > > be any concurrent accesses happening at the moment, and therefore it can
> > > > (and likely will) introduce extra writes to that memory.
> > > 
> > > Is that how it really works?
> > > 
> > > I'd expect the atomic writes to have what we call "compiler barriers"
> > > before and after; IOW, the compiler can do whatever it wants with non
> > 
> > If the atomic writes are relaxed, they shouldn't have "compiler
> > barriers" before or after, e.g. our kernel atomics don't have such
> > compiler barriers. And WRITE_ONCE() is basically relaxed atomic writes.
> 
> Then perhaps we need a better definition of ATOMIC_RELAXED?
> 
> I've always taken ATOMIC_RELAXED to mean "may be reordered with accesses
> to other memory locations". What you're describing seems likely to cause

You lost me on this one. if RELAXED means "reordering are allowed", then
why the compiler barriers implied from it?

> problems.
> 
> e.g. if you allocate a struct, memset() it to zero it out, then publish
> it, then do a WRITE_ONCE()...

How do you publish it? If you mean:

	// assume gp == NULL initially.

	*x = 0;
	smp_store_release(gp, x);

	WRITE_ONCE(*x, 1);

and the other thread does

	x = smp_load_acquire(gp);
	if (p) {
		r1 = READ_ONCE(*x);
	}

r1 can be either 0 or 1.

What's the problem?

Regards,
Boqun

