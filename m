Return-Path: <ksummit+bounces-1841-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E3A40B09
	for <lists@lfdr.de>; Sat, 22 Feb 2025 19:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04DA1895070
	for <lists@lfdr.de>; Sat, 22 Feb 2025 18:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38E620E6E0;
	Sat, 22 Feb 2025 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CTu4YK6F"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2701AA782
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740249900; cv=none; b=X13/tKF37KrB4aTDPhSm8oldPZc8yQltwD679FCSlJkiEtk510K+vxJpfAsYRzfHvYkxRXmlMIt9x+dfMVSDPV9T7seduzbWceJNHesB5lejLLlIPY9HaCOYKpNSMr1ls9Kndy9TuLo8OHdEpnoZycWW/kyLupaqg1knVTG3M80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740249900; c=relaxed/simple;
	bh=OWQ/8rNUcjck7tkRuYyqikXWKplXwhxhtLF2xDKFeXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNu0figeJjSdHGKCJpvAl3KEkkgexGJpr13GEDse1CfsJLOcVMEIPTYgnR2RPY+mYNIm2wpvGJImNs8c8bQ7QxgXkoQvA+lzbW/5xltsjxlyoOBOQtYgM/0nUpYYf2XvWqbDkG9tIxW28bGoQCF3l2wxV+h4vgkw+OYM/UDz0bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CTu4YK6F; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7430e27b2so512501066b.3
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740249896; x=1740854696; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2GmfLwYqjSfqdj0NeOV5aIVpVPfwUhlh0DRZJ2UKXos=;
        b=CTu4YK6FrAvTv/YdMPOJi3u2KXIL7GLFdkN3uTLOL/Qf3KsiKoDUH4e8MsqmZyqAqs
         n5gVw93V+Gkofs8bxzvV1CD3E1TuqAgTDsu0O3TJGJpDuZ2hdfy9nBxH7Lo2i0FWzF3N
         0cRJJie8H8GnVxdmJnvEjEdkBUXlZJiWE+4FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740249896; x=1740854696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GmfLwYqjSfqdj0NeOV5aIVpVPfwUhlh0DRZJ2UKXos=;
        b=wZlWmNPejX8YWHEQn9IYD6rFT8O3+XhGKj9itQERFhAM61ViaCqcjB1DEJb+OW6Qhr
         0fxn4N8YHWmxXITDsVXWKX6kgFiT05bvjKasynvEuWyjhqb1QCVwAS7ryGaRH8mzIsMU
         cNYS08uhB3M+1tLopIItWWffrKLh1VqH59GFqrVHaAsC+yVIXx06OsAjSWhBAv5feFaG
         JqkYf96v9X+yYT86tZDXvdK3hjfQap4yNxdYEc+cLl2mnVIjkgXBdt2plVDtpEyFIWW5
         vzdJMMKoMt5eBgjqAdefWHF+S2qyQOODjq/We7dJAaIzivuNGnHGQENAlAOcRL6g5qHA
         bU2g==
X-Forwarded-Encrypted: i=1; AJvYcCWGEnmPlnZJwxB1RrIToKP7DWiA0DhudT+6jS7kN5tj+eOJN7gXeEtNTqkgOEKAGkR34SCWviOz@lists.linux.dev
X-Gm-Message-State: AOJu0YxszOuABLSkA4+2ShcKT8iG4/S5HGPWqd8AYeZUb7PBnvXvyIKz
	b1OjbmOBoYq99j+bQcwuMEPlKBZUMlLA4tRDgeQlWjTiIPZ0S6uRTjWJt/229zInSvmlMaMbcPo
	VUO8=
X-Gm-Gg: ASbGncuxo/FCIupGDKeaWHhh5w6IHAxh6g68G9mcde6MHg+0WZ8c7ylHTZeOwgokPgQ
	8jvJrxifLZYeZvQT+Oh3bB5rmiYG4p+GLXb4KXWnuxZJnUHWHHem9wW1sZoUOOjyqlzXFGaGltf
	o3Tb23tdkbO+rwzZ9QY+TFJacgs4nRDNI5SFEWcjZHDtK3zMYhNfAlLwVndJAZbNO6TFr6patOP
	15DaKe5zvOpowwZ7SkYUxFbGhiRXPGIOEpXI/ftypfX3HO2KaBAhyU1O3Jx6FiSNu3m8D08yg2S
	2fjJLoTCIRCJUm/e9Bia0ozbUZWG6KY7Fb2Eb7tAIn+rzTpvo65IdDtsYZZ4WL7fEC50dbJx/gp
	f
X-Google-Smtp-Source: AGHT+IEnYst0/BZgoFyWuRX3m+pl2AdwApUSUe1L4z3YT66ubrr+xNJc+0NzpkSrmV85UTZIkgMEDA==
X-Received: by 2002:a17:907:7216:b0:ab7:ef49:23a7 with SMTP id a640c23a62f3a-abc0de5bd55mr681771566b.51.1740249896567;
        Sat, 22 Feb 2025 10:44:56 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbab339807sm1074699366b.162.2025.02.22.10.44.55
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 10:44:55 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so5796633a12.0
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 10:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZfpjIOjHJ5XEa+0y2fo+NDcrX6oqedD17r7VSnpmvFbLE99wB780YIensM1gl0YtqgLQPURNM@lists.linux.dev
X-Received: by 2002:a17:907:724f:b0:ab7:9a7a:d37a with SMTP id
 a640c23a62f3a-abc0de1954emr621935366b.43.1740249895227; Sat, 22 Feb 2025
 10:44:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
 <20250221172415.5b632ae6@gandalf.local.home> <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
 <y75v63zqmgd3n42bprrbs2ppg32vhk2isppi6wxn7lfsdwd5sn@jm74cuwhadbj>
In-Reply-To: <y75v63zqmgd3n42bprrbs2ppg32vhk2isppi6wxn7lfsdwd5sn@jm74cuwhadbj>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 10:44:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEQ7wd=iRN1Du-_fAqXgqEfCZH27PisDNPCpusv3Swxg@mail.gmail.com>
X-Gm-Features: AWEUYZkGmBfM4yXjsFNaaBKIjcw5m0UrJ9-jgNYDnIvr-gmrGabmAZy5fq4X8l8
Message-ID: <CAHk-=wjEQ7wd=iRN1Du-_fAqXgqEfCZH27PisDNPCpusv3Swxg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Martin Uecker <uecker@tugraz.at>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 09:53, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Because it sounds like coming up with a different way to write range
> checks is going to be easier than coming up with pattern matching magic.

Sure. But honestly, forcing humans to write non-obvious code is almost
always the exact wrong answer.

When the basic pattern is an obvious and legible one:

        if (a < X || a > Y)

saying " use a different helper pattern for this" is the WRONG
SOLUTION. You're making the source code worse.

Make the tools better. Don't make humans jump through hoops because
the tools are spouting garbage.

               Linus

