Return-Path: <ksummit+bounces-1970-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587FA46F01
	for <lists@lfdr.de>; Thu, 27 Feb 2025 00:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684273AD499
	for <lists@lfdr.de>; Wed, 26 Feb 2025 23:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DBF23A9AE;
	Wed, 26 Feb 2025 23:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvOBdLfK"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C125E828
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611301; cv=none; b=iE3kJtLzoTgtL5xzuhVJRoCc4ht4NiH1sUk+JJOKQNQRyHPMhgHV/9ISGvnTY83Ypv6+s19ndTar+xdoEa8++GPArTcMhvcRl7XelHIFh8hjHNkqMldHK7isF1EuOjiNmBOgqec5To4wqUTjUJfWRmIvKJ1jUhqVl4WjWTqYXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611301; c=relaxed/simple;
	bh=QwvGNkau5Bh+dIR6tn3UJPayr4vQX3G/2XwtNvuU3cA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zw27KsOii+qo8CMnlq3OF6Tz2Dwe2XTHgel7fFX0IaCYVcCS3t7946NIy+Vr9/Wsynao9Z45bSfYvubYq16cLRtRsOme9gtsuiTWQi4LqvPY8ZJV+8XLyVqdT9pfOopTkY65cYHsRsyggfO3IrDrelZI/Xr4Zq/bgli6eiACSaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvOBdLfK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390cf7458f5so285421f8f.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611298; x=1741216098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kqHl6YqOGD3BSAVr59pspE1LiZ8g6APu3kUtEV0wPY=;
        b=BvOBdLfKlEoCriQnllpC9PPe/pmlJ4zYWUvx22idmEd8dpX3BIr80kBw7Dv/PrgCZp
         ygrWrQMM+EBbGhdRYLC6zryGih4HcGomescGPkWVH6PMhWAqkeenRMQ+p3PFn8kEdd7a
         PX2BGTRJOv0qGXMzftvepyXHOS1AfCp85X+sy4Oahevr+n7miRL5hWHBBa+Vu4kRwD+t
         5D616i+301/4kxq88Ud7zocl+/mEmtey1Z7IjEGvJeh8G3NK2NX7UGnB3VM22yLyo2hp
         CpNkVvy4hxRV2mirXtjnAbdFBpVyM212AhmpZrUCyxqV9B1URsMw402JxAPO3E0G96PD
         N8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611298; x=1741216098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kqHl6YqOGD3BSAVr59pspE1LiZ8g6APu3kUtEV0wPY=;
        b=hY1lgNlY/JvINfI+g5Yf27SqLtM9LDya95caPF7J9s0QSJaPRKOiMEK5qwh/FHslgK
         27e5keLtl5s59ljKBKMDmAN4nk6GXeTzf93vomdJOdOKuTGHsWLCxGlF1ypTfUnRE12w
         FX4bgKDS13LMwkq35qYBIWYVUuRp0UZQJqvBWvbxZgKN3ll3LoqR5TAwtcKFu8kjRRK5
         KItPhZ5TP/PNyMeFH1ehFL4R3XH/YhgOEXOPP1lOqc/RMycifr/MYRpWxHONsF3RZ9ea
         M0zBG0kgfTkfaNnvq0QTyaRlLx4Woj3dXJXKl+dzKnD9zBUiJHTNrvI0zgSwWanDFv2X
         Gi4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl4BPDn7Id/t4fZWOfK8nx8E/1+XXxkfqXWoIuFBpaUKHL9Ett2mZYppDefmjZrkuRKp8yjoTQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8lhzFKsOxNOQJsFHdd2DP5kSeWh6XEXAot4t98mXVWi5n6snJ
	ptFl/ehQwtvocZjakph2zqlTheFCJ78rwuwuelPPNDCABMPwV5M5
X-Gm-Gg: ASbGncv9HzVyX6Qp+D6Hry0QCCMGnaRtr9G0cD61SyQfPCTuLwT15VVtXZDvdXvcY1M
	LydehGR33P+/EMu9vGu+ke3FblmCpvxr5GCk/TNWO2aXNnLxABigC+jzdEiY+hIPCORsesib2bQ
	HFhPQ6vj7ZJy4phHh++VAjIcJJEyttWMPBmffpxhnxHJ258a4Q8CZzFSvieuScXLXtlQMzTwhXk
	jj0cajsk+tk8wCB/UiUZhwlYav34PqoONDTMDOJQfQnVo+X75oxarh5XZxcdsQT5EUgFUC/tYTE
	AesJmrLse9Rs1CRtj1xyDfJl2EaIFXCanbsYXfjq/G90EjnaB78/PbbSpfhAHilL
X-Google-Smtp-Source: AGHT+IFb5vDf6eK/bH7+GTIOY122a6dwufeCuABNTioN79EKFgWyAgc0vc4m9UlnZFbwXhjvhwjBkQ==
X-Received: by 2002:a5d:47cd:0:b0:390:d7c5:590a with SMTP id ffacd0b85a97d-390d7c55ddbmr5289864f8f.10.1740611298093;
        Wed, 26 Feb 2025 15:08:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e03asm208817f8f.95.2025.02.26.15.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:08:17 -0800 (PST)
Date: Wed, 26 Feb 2025 23:08:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ralf Jung <post@ralfj.de>
Cc: Ventura Jack <venturajack85@gmail.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>,
 torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com,
 ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250226230816.2c7bbc16@pumpkin>
In-Reply-To: <7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
	<20250222141521.1fe24871@eugeo>
	<CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
	<6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
	<CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
	<lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2>
	<780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de>
	<CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
	<f3a83d60-3506-4e20-b202-ef2ea99ef4dc@ralfj.de>
	<CAFJgqgR4Q=uDKNnU=2yo5zoyFOLERG+48bFuk4Dd-c+S6x+N5w@mail.gmail.com>
	<7edf8624-c9a0-4d8d-a09e-2eac55dc6fc5@ralfj.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 23:28:20 +0100
Ralf Jung <post@ralfj.de> wrote:

...
> > Unions in C, C++ and Rust (not Rust "enum"/tagged union) are
> > generally sharp. In Rust, it requires unsafe Rust to read from
> > a union.  
> 
> Definitely sharp. At least in Rust we have a very clear specification though, 
> since we do allow arbitrary type punning -- you "just" reinterpret whatever 
> bytes are stored in the union, at whatever type you are reading things. There is 
> also no "active variant" or anything like that, you can use any variant at any 
> time, as long as the bytes are "valid" for the variant you are using. (So for 
> instance if you are trying to read a value 0x03 at type `bool`, that is UB.)

That is actually a big f***ing problem.
The language has to define the exact behaviour when 'bool' doesn't contain
0 or 1.
Much the same as the function call interface defines whether it is the caller
or called code is responsible for masking the high bits of a register that
contains a 'char' type.

Now the answer could be that 'and' is (or may be) a bit-wise operation.
But that isn't UB, just an undefined/unexpected result.

I've actually no idea if/when current gcc 'sanitises' bool values.
A very old version used to generate really crap code (and I mean REALLY)
because it repeatedly sanitised the values.
But IMHO bool just shouldn't exist, it isn't a hardware type and is actually
expensive to get right.
If you use 'int' with zero meaning false there is pretty much no ambiguity.

	David


