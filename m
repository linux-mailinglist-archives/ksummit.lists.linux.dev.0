Return-Path: <ksummit+bounces-1809-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A53A4023F
	for <lists@lfdr.de>; Fri, 21 Feb 2025 22:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF364428620
	for <lists@lfdr.de>; Fri, 21 Feb 2025 21:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBB0254AFA;
	Fri, 21 Feb 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnTK/8dl"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E661FC105
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740174307; cv=none; b=ie1nRA7GHQldkY0gX0402RnW4JPyxjvIVxfPxPnuiLmfUciod9Ovn501b+XXNcHpM9q8vUh79HjVuRFZG1ciBvGvBOEDW/Jk1+DfGatNN+ENwnQlRXx8OzsoXx1fOFgArBuSF6jlPiuy4HoaXINBgWit2nsTAdqyZ1O4ZQWJu5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740174307; c=relaxed/simple;
	bh=77cxc+L7gEsSz9B50V7m+LLHVcTxPFOxH675Ge037MI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=faH+YQUMSL5m/fCZZuLxouhAVJ5yAK1MMit3s+FwQNxlC+11yDMqxGsVndp0Pz7lp9hfQ2PGFqQ3J/FL11+Rq/w9WtVJnjqbLXrJ1lqbJ7X/BoF83XlECxxvcQmXZE7UxaUufL/BWdOl9hrYm8xja757ampzK4ARXO2P8OGQQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnTK/8dl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso1405696f8f.2
        for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 13:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740174304; x=1740779104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPEGG+QJeVb3Vp5xacSyItMTz4p/kfs9+QzZ02Bxf/Y=;
        b=TnTK/8dloFnxU36iGVEXwt8RL4LogO/g90iZAh9TwpiW16yki2VlSeYXLePDdFNG24
         wgVPzZgAkdFDJYm3C8J3QD3MmMSkQSdY9h0dE8OWGR8R4R8t+AmTy7VLobK8JxSDgQ38
         L7f9BccVn9Zy8Xmxl8oAIaNszkCY8KJY8LPNDCloYGfFO2+OWKFPOtjcW2qujnnXFdH+
         crysl58mD66SDuc7+nKZNMAKsNs/tuN7Lzc4x1EH7o8FhtDgzpx9zmyZ18Fm40nrsI7a
         caKnTpRDmyci4zTWZ8S1MOiJ0BGuD37UtqUYDXLiObxArQZ+zcH1IXMoxxIcCc5HuN2O
         afGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740174304; x=1740779104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPEGG+QJeVb3Vp5xacSyItMTz4p/kfs9+QzZ02Bxf/Y=;
        b=nfZo+lClCQfT5G2h2Bbh5p4Q5Ll9F4AQtqmgsZI+ygxkTFcZRBXtFNCT24jjiYlyYD
         uznJYHqyGwQI49wI5XFZ8TIXr3ujMOeFRfjcI18Bva1CAaGxSOrtrVDbjZoZyOEcj3wY
         pgFUI28kRwoIws4TeDMp9Lew6xOJh2F2UwwFABnzW8I07SVjMfruAGDiY2NJbsuRUzcp
         NRmOZAz61a9/T3a1cqQNL2NK5qImwbF/7nohcfwZ1MnAPENVdZ7LRN0ozcP7ugOZMQAK
         FUPVSr5yABi3uehlLiHVj8hUjEfi20esgAKUcVfvOU4wV2Kd5/ejZMNhINKifzJTZXJb
         LZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCXCL5J6HFOKD+9ADe+W7cC/jLK2vTfq6DuN1Yh99LgvhfGmUfcx2XKXMtPIPJnMplz32cW7BmYE@lists.linux.dev
X-Gm-Message-State: AOJu0YwGjNkkBCmOYcdof1tAcWp3ASDPs6eD5dgDIkJX7luslgApuKof
	iPKN5evpyoSjaSlpzvaJ6MR/ZFPZcWfEYE2VQTcrYTsF/MzvDQDE
X-Gm-Gg: ASbGncuPu1Gn5Sd6hE0Hp3T/RKi1447YukX/S56iWmhLuV1iLyWuP+vPOCW6bSqcd4J
	k8fTPj/F2rtFY7a7J1um7CcqHU7K63NctHF/uz9Bv7GQxW512bKtwVfhGzxTQ8A5FCoJRZHtgYz
	acKTM9Vpvq1VzF3XnT2JXTrNiyO5Y5KW+ObIwX7lAxpFd4ggHK28dxtrk/G/O6Edy0lXFbZ5XOF
	X3JjV4lVtZ8LgHHrWeqVKvEK8hIjRSGRzS5PYQb3tezhO/QsMXbDiMiUesS72y1F9s7jLiG2mBh
	0Q8RbMq3Fbli23JHzQ+Ox3XTcwC0x3F4TYDoDYlF5JciOJIzjdbhkVeWn2AjV6jp
X-Google-Smtp-Source: AGHT+IGs+RHE6sIXvHtolmoTaCjzVDl5T6yNybvmSDm/Idz17ST+OAfBTvT0SyHLs5ZNMaMuEH7fQA==
X-Received: by 2002:a05:6000:2c8:b0:38e:ae25:6d66 with SMTP id ffacd0b85a97d-38f6e95f9b8mr4656870f8f.19.1740174303828;
        Fri, 21 Feb 2025 13:45:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fb6sm24093400f8f.44.2025.02.21.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 13:45:03 -0800 (PST)
Date: Fri, 21 Feb 2025 21:45:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jan Engelhardt <ej@inai.de>, "H. Peter Anvin" <hpa@zytor.com>, Greg KH
 <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig
 <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250221214501.11b76aa8@pumpkin>
In-Reply-To: <CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
	<Z7SwcnUzjZYfuJ4-@infradead.org>
	<CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
	<326CC09B-8565-4443-ACC5-045092260677@zytor.com>
	<CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
	<a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
	<Z7VKW3eul-kGaIT2@Mac.home>
	<2025021954-flaccid-pucker-f7d9@gregkh>
	<2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
	<2025022052-ferment-vice-a30b@gregkh>
	<9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
	<n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
	<20250221183437.1e2b5b94@pumpkin>
	<CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Feb 2025 11:12:27 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 21 Feb 2025 at 10:34, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > As Linus said, most modern ABI pass short structures in one or two registers
> > (or stack slots).
> > But aggregate returns are always done by passing a hidden pointer argument.
> >
> > It is annoying that double-sized integers (u64 on 32bit and u128 on 64bit)
> > are returned in a register pair - but similar sized structures have to be
> > returned by value.  
> 
> No, they really don't. At least not on x86 and arm64 with our ABI.
> Two-register structures get returned in registers too.
> 
> Try something like this:
> 
>   struct a {
>         unsigned long val1, val2;
>   } function(void)
>   { return (struct a) { 5, 100 }; }
> 
> and you'll see both gcc and clang generate
> 
>         movl $5, %eax
>         movl $100, %edx
>         retq
> 
> (and you'll similar code on other architectures).

Humbug, I'm sure it didn't do that the last time I tried it.

	David

> 
> But it really is just that the two-register case is special.
> Immediately when it grows past that size then yes, it ends up being
> returned through indirect memory.
> 
>                Linus


