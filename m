Return-Path: <ksummit+bounces-1398-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E8930AE7
	for <lists@lfdr.de>; Sun, 14 Jul 2024 19:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1DC21C21182
	for <lists@lfdr.de>; Sun, 14 Jul 2024 17:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC01913BC03;
	Sun, 14 Jul 2024 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RZidHVUR"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815D139CFF
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720976891; cv=none; b=DvC4eq6ZLJ8wdpQA/VYBQCUVys1MT5+iwUdhgKDeis1iIov9STQtyJgrj8wzjXORvXAzPZsNz2ohRaMAnYe1yFSuXFZh4UolGwVjXH6bfK7rI50XlVRdGLDHvoFYXSTWHlCK+W9zVbvTZgNqahUG2YYoK1RhysC/KnA9FDHMMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720976891; c=relaxed/simple;
	bh=uTXS7JymJ6uNrHgTTegFrjGFThhFS4MKXoa+MM5r27s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTn/BahLCrAgj23Rq6I+sEO7CvOiM6xMJGqUsTDKLdTUG9IZSueeBn1PJdRDSLT+Nc738wzTqGoRR8E2TKGdnnKYIWNzXLs5x4e36jHKXargXG9YAJVYi0ZM0L/9YxA2Cim63VsLfLm8R0Sx1T1dQX3Dyp0qxdS6J3puBg49pcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RZidHVUR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so7920425a12.0
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720976887; x=1721581687; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKbe36E3IqyS7nxpqq0ARoFQm9TgahprQJhwneecDA0=;
        b=RZidHVUR6pmRLn4RYbAWJ9YaZWt1k0eE1RSJX/gLe+rGwP4n1RpyeNp+s5wJ+8CqiN
         WE1P1PxM49XNUmjgGTnicEu5suTvPjnW0QqUCf3wMVPY9gQhO1QIbgip2PoHMUoMmyYc
         W4pmfcye8OAKLvdU23DkSqFVJLZYjna2m9dF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720976887; x=1721581687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKbe36E3IqyS7nxpqq0ARoFQm9TgahprQJhwneecDA0=;
        b=eFr2HhPUTIMd5eya5rNv0vKiv3vrIHG+hBa5/3EMAAt3boTzjM9IaZDrlioSTilrU9
         xlpHxrcqXMxMN4ZcflxNWzGpvzPGAf5k6tbrN50ljYjR4zkTYAElMPVcxvdLd/8xJWEk
         80c75MRKWjO9PCEoaJrrDWKp4eecqHw+eXEdxKawiglkjLKHrnVa3anDY/ZPOI7dHtHK
         pFaIZR45Trgx7ynuAgpWeMpyv1ht2yqem3wzyybMOhJZpLTRh3JWwtvtajzCoDeuV8/y
         h+a3pqhr73w1zKLyBy0ZtdshCPugkJJaQWDKUclnLMjjMkAV54uJTTTzPaYW1pe2tYXj
         u35g==
X-Gm-Message-State: AOJu0YynrPXIV0cFI1YQ/5bMch49LpXKGZWgdshKrt/H1Ep6i4gbS5of
	ANB1Eph2/7d4K7SRHySAdL39ohNZSLBJN2UbbrDIrCEuN8NhmJkPcq0DyqMxBOCaYsc8NHpL9Yd
	hF4I=
X-Google-Smtp-Source: AGHT+IHfJX11YSmZBKUOEBCk6Qr5lllMUrikkvgynVfDXwtK2mkcd7cNPeYBvWbM6qEXG6ADWQBw7A==
X-Received: by 2002:a17:906:39b:b0:a77:cfe9:8ed5 with SMTP id a640c23a62f3a-a799d3944a1mr569268166b.30.1720976887415;
        Sun, 14 Jul 2024 10:08:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1ef5sm142904566b.134.2024.07.14.10.08.06
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 10:08:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so7920398a12.0
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 10:08:06 -0700 (PDT)
X-Received: by 2002:a50:d58e:0:b0:58c:5ee3:30ca with SMTP id
 4fb4d7f45d1cf-59961245c8amr5524935a12.0.1720976886058; Sun, 14 Jul 2024
 10:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZpPFJH2uDLzIhBoB@sashalap>
In-Reply-To: <ZpPFJH2uDLzIhBoB@sashalap>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Jul 2024 10:07:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
Message-ID: <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jul 2024 at 05:31, Sasha Levin <sashal@kernel.org> wrote:
>
> One of the main issues is that most Fixes-tagged commits (>80%) end up
> in a stable tree, leading some authors to omit the Stable tag
> altogether.

So as others have said, the fix to two confusing tags is not to
introduce *more* tags. That only adds to the confusion.

I honestly personally will likely not ever use any more tags than the
ones we already have. Every single "let's add a new tag" proposal I've
ever seen has been pure garbage.

People see one problem and want to fix it by introducing a tag, and
think tags magically would fix it, when adding more tags will only
cause more confusion and make the existing tags less obvious.

               Linus

