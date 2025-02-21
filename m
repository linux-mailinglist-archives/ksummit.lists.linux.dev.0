Return-Path: <ksummit+bounces-1781-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E7A3EC32
	for <lists@lfdr.de>; Fri, 21 Feb 2025 06:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9DC3B8D70
	for <lists@lfdr.de>; Fri, 21 Feb 2025 05:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE61FBCBD;
	Fri, 21 Feb 2025 05:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnuQsuLL"
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B61F3BB9
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 05:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740115186; cv=none; b=emtZMWeEXgS6aEb0Dh/fKmkjAZRP34gNuBTKtAQ+MgQCJVfHjV8b6c209uDvofQewzLlCw5UcHvrcsJ31jNLIfeqM43FSWLhFZ5PwMXcJ1U76KryA6iu/Kv5+ZLG9V3yKxda/u4T2LWL2oVK4BCS/zkcQrUDy1ND073iUpLd5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740115186; c=relaxed/simple;
	bh=O8d0sg3OiW0EYlu6tUHyrluwGg3zHX9W1ljOIFTfvP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/X203SpuGuvUIV05F7BPvh0YQD2hapObFmrixsWxAwIqpMK3PsDsiClo9v70uQ5vIJIdvkbYjN/97eQxNrvoWkcODYkyX9OpjiuoF3YSyW5emgkpyKUJ9Y+G13cc7vG8P6slfnFqMnHoMhQT7oI+1Lxwm2PKi0mCjIVdKzEGEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnuQsuLL; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2adc2b6837eso436949fac.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 21:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740115183; x=1740719983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7GxnhS9WVFYcGLggu6o4ECrksBl/EI/neRDN6fay0Y=;
        b=QnuQsuLLqhoeOdNu/R5YODy394sD7UaqRkjqHV1ZSZr6sReZRe0pOR0shHqKqpDv6u
         os962F3Vd18gKAXbDxTQy4QlpCEEJ8GRJZ7uEGRaC01SWiJ8VNyn+7PgCZyu33/s88FC
         2FL82FkW4FoMwtCMOt7+21t4shq1x+ipVaCszTlNK3tUCVW/ADw5MQuQgx7rDxO4XG+7
         +GY8HUryIvsSeR4WqqAL5iOpUmqy/FsGeTahbwbSnAxQwfSdFQwJVjQBNctuaFp38LDH
         O2sEjn6q264YBiI0CbSuCLt7zp5NI4BjBjOK//l+2K/La7zr6T4eBAAViLglBhws8iDf
         FswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740115183; x=1740719983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7GxnhS9WVFYcGLggu6o4ECrksBl/EI/neRDN6fay0Y=;
        b=T52EwgsABSebG0xuv9GvY2sbdqTIMp8FN0c1RYx3jlPKW8b5S74MQpUHz1PN8Bl34J
         JukrmIpoHdVZDVZCb37Um9Lr/EHBV8Qgf1/MFOJZqreUYi4eKSpbpmVpOPAOrhMg9v0T
         V+GjfNXKila0tI6thiuWgz7E3plF2blj5RQluq6VUtXmce7B979PXFeuJ044NA8LNYVN
         ROqbkBCCxzZhQW/sEPLNOhwQKlRoF89QEgEGog1Uh1uJOzI3xWur/VyAKomD9x3TgVWJ
         62ENVnMzho3xsVmVigIPqN8WpCCZ7bXiM2bbN+XlQB9HbcbGrkDN6L8sLIizmsGT8LbU
         2uvw==
X-Forwarded-Encrypted: i=1; AJvYcCWmqDNDjZ4KoH1P3fVOIwfr5bNJ2m0ry1vWyi4NWFGKM74t0lH3Hx1cdgsRTVTOT1ACIA/1gNM6@lists.linux.dev
X-Gm-Message-State: AOJu0YzzFK0IA8l2SR9Ey5GvM3VTRExe0cQt6/K2ZubTIFBgj1S17b9I
	6QE5k9lurrdX/sjJIzM6XURH/Fn0NglTz6QmtVIDQCxFAy/QVbNi
X-Gm-Gg: ASbGnctFsXQww24mX/XmdSRVuFIsaWRhPEbPZcnfg5KjxWiVmx3z/HPmzmnQumQdH/P
	N0O1dzxoXTRZEDGJhCcVSJN1VZfOlsKxFPS919fr4xfvUv9EDqfAtwgjYYbg3vQ0r427IKbU9X3
	+PC/Dd4josVcXMSLuLGGsttMujq66UsL0Q/hWYpTsqqUZp8JK+Zx70Qut/SVuCK0oPzy/phy8gM
	GKuP6Qx/usXhsZYnmw+rd2l6jytgM8/GF6JeK9nUFtsLG+f62kVGvB2gECVBnO9zgQswIyLJiFl
	UV9uSbProufmaVw6ekzNW9YHUoXvlm1/sFo=
X-Google-Smtp-Source: AGHT+IGoA6z3KE2h72mJwhh7s7O3jt1mACU41v7uUqoGM/05ZbXw7E/XMUInCarZyEeaGUD9Lfpnrg==
X-Received: by 2002:a05:6870:9613:b0:27d:10f5:347 with SMTP id 586e51a60fabf-2bd50d01beemr1409542fac.15.1740115183524;
        Thu, 20 Feb 2025 21:19:43 -0800 (PST)
Received: from localhost ([2806:230:6026:c0c8:4ae7:daff:fe31:3285])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2bc70042fa9sm6016647fac.43.2025.02.20.21.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:19:42 -0800 (PST)
From: Felipe Contreras <felipe.contreras@gmail.com>
To: gregkh@linuxfoundation.org
Cc: airlied@gmail.com,
	boqun.feng@gmail.com,
	hch@infradead.org,
	hpa@zytor.com,
	ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org,
	Felipe Contreras <felipe.contreras@gmail.com>
Subject: Re: Rust kernel policy
Date: Thu, 20 Feb 2025 23:19:09 -0600
Message-Id: <20250221051909.37478-1-felipe.contreras@gmail.com>
X-Mailer: git-send-email 0.1
In-Reply-To: <2025021954-flaccid-pucker-f7d9@gregkh>
References: <2025021954-flaccid-pucker-f7d9@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greg KH wrote:
> But for new code / drivers, writing them in rust where these types of
> bugs just can't happen (or happen much much less) is a win for all of
> us, why wouldn't we do this?

*If* they can be written in Rust in the first place. You are skipping that
very important precondition.

> Rust isn't a "silver bullet" that will solve all of our problems, but it
> sure will help in a huge number of places, so for new stuff going
> forward, why wouldn't we want that?

It *might* help in new stuff.

But since when is the Linux kernel development going for what is better on
paper over what is actually the case? This is wishful thinking.

Remember reiser4 and kdbus? Just because it sounds good on paper doesn't
mean that it will work.

> Adding another language really shouldn't be a problem,

That depends on the specifics of the language and how that language is
developed.

And once again: what *should* be the case and what *is* the case are two
very different things.

-- 
Felipe Contreras

