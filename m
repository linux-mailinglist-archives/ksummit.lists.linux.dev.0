Return-Path: <ksummit+bounces-2546-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157EBE2B54
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239AB1A62EF6
	for <lists@lfdr.de>; Thu, 16 Oct 2025 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729A131CA50;
	Thu, 16 Oct 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="UuavZ7qQ"
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312442C235A
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609777; cv=none; b=uOHvXyhWtY4xHVaxeMd6NURiZWOaqbSZrKOlR9FQxWcZpGw/Hc2ASqLZ5bBes3anTDoKYzo2aPljQqI7ffQ3pZk6QFIGhJQNdtShxfuQjmUGu7D/P5B05KIJm9MeOT+KudGs91/XlYVlwrwE8hf5uSr9BqweOD4+TOL7p6dJoLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609777; c=relaxed/simple;
	bh=akP1iV0axyEuMtlOaIik732dTQeKhwv6mkgEfyuP6d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZI6qKNK49zz4MfZ5o/NDgZqwK67LY7EGK5V6QZ3wVGBALpPoLcL4QH7hbBtYaQOzss+fvjtMedC+A4hjWBOUI0XWkYzwEbpg0zVS8shjaojy6JvzgxbU8um4Tuca3+UaD6ePSzjCRxIVVl9AV+h62jC1BTUO7AYMxllm+jrEwE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=UuavZ7qQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so1001172a12.1
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1760609774; x=1761214574; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AqKayTLj7msO7nr12CoYxPbhyLThckDUqbrKzOOjpnk=;
        b=UuavZ7qQj3u5+MSO1DHTr5ldYkywRsYxstVc0velktyvJuYLLotkT5W7PDguNzMedu
         5KdjyiWUVrAtPeZ1lK+VmLWsuxBD2aTxphvwCNHJohqiCQW/LvMZf/4S59iravkzabNU
         lPqZOlZPX8lOOMBsfPyw28mAiKtxrv37sY1YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609774; x=1761214574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqKayTLj7msO7nr12CoYxPbhyLThckDUqbrKzOOjpnk=;
        b=dj02IPdEZs5rEGuOsYEa3aFoEgvIA+C0rbBfbk46Evk3GI9LeU1MecdQ2bAYaL1ZOu
         2ioIZBP/iPS8HAAiGxm3ks+82gdIE5IAr1LmxbgWAtPiQo7eRF3OnCSvMnLng5T5szlZ
         2kvGyOZNiL+LlVa7ubquQ6b+pmZGhusT7AY/g2xq9r3Pt3UKHkNRX7k+sxPG4nqOjdIx
         yWzoBeZnSrD3whvqnZkNuyT2FgvLUC2tE+Vs657M7w8MOEnZBDCmycdohxD3dR9n+zM7
         r8oa2eDWKY/qqIr6ZNb2pkbVE45aHAFbxIvax4bedAJQXGaoDqxjH7myaYdf0mvbmXi7
         iIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuF9j76D9a/LNrNcdE5BPSNo7frYMCSgbo4044J0olffwofpZ+v2zVvbv/cFSPUJD/3q632gA8@lists.linux.dev
X-Gm-Message-State: AOJu0YxroQ/dSyYW/XUNIylC63gjeQ2Wo34pbq0b5kRrCQXzXfzmOAKz
	ycEymhEk4tsoPrhz7gkz2x44VR4BEmedYuJaosn7+gMsnq2FCstDbWFsJw2Un9LRTw3YhzQgQw3
	3TLnh2N2oLS8SmqN7b1h3Aiv5go0oFY2YOpQXfYOG9g==
X-Gm-Gg: ASbGncvt1Qlus75/vSorpR7MtMFCapjKR7N8x2jSf5VysiuSmyPmcrcXW252RTt+Ga7
	ZyrR/XE7ZOPXzw8nhlfsgEYM4QW11fb2e0X0sYt9MV4U560IERvuaJvOs3IIxApJ9TJiazVPeo+
	uJkiAYSX2JfJ6MxkJz/HokVUroe5t22v+Jft+FTzK6UMsrdlUop8ECufHz3QhIOx0OIIDAuIk+f
	mDWzmTNLfqrqdVvD8nit5QaxcKqPXK2aUDjJXuEF76zRPIlwhy6ZM6rA2wWHPBM2GFHnUbXhGOa
	scNBo46M3bbJgFIQo8xn1ikP
X-Google-Smtp-Source: AGHT+IFN6BNxWfqcco84bLB+E3zd06tD/hcY1v2GS07EfoukRS0Y1bVCVr4GG2dfF+SEwMDpfrt0JOI9sekeldXMQkc=
X-Received: by 2002:a05:6402:2808:b0:62f:5b56:423d with SMTP id
 4fb4d7f45d1cf-639d5b8b64amr30817831a12.14.1760609774320; Thu, 16 Oct 2025
 03:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com> <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
 <20251014153521.693907a1@gandalf.local.home> <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
 <20251015182245.05c28887@gandalf.local.home>
In-Reply-To: <20251015182245.05c28887@gandalf.local.home>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Thu, 16 Oct 2025 12:16:01 +0200
X-Gm-Features: AS18NWDgOgP1DqVYpiRdZFRcc_24lfupbJgHJMwFJvZ-pIyJoG-zE53ix79SRPo
Message-ID: <CAKMK7uG7DjduHj7hjFi2sk11UqbFcZHuXBF_+Ea7SKbV15e00Q@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Oct 2025 at 00:22, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 16 Oct 2025 00:01:38 +0200
> Johannes Berg <johannes@sipsolutions.net> wrote:
>
> > So yeah, circling back to "benevolent" -- for me, this has definitely
> > broken the "benevolent" part and a lot of trust. But that's fine, I can
> > also do a job that heavily resolves around following a manager's
> > arbitrary whims. But my heart won't be in it.
>
> Yes it does appear that we all have extra work to do because one person
> doesn't like the current method. I don't think I saw anyone else complain
> about the "useless" link either. Maybe I missed it. But currently it's all
> been "Alright, fine, I'll work around this" and not one "Oh Great! This is
> most definitely helpful!", like what happened when Linus created "git".
>
> I'm currently looking for someone to help me with my maintainership. Masami
> came on board, but what happened was that he basically maintains all things
> "probe" related and I do everything else. That split still takes up more
> time than we have designated.
>
> Unfortunately, I've had many people say to me "I don't ever want to be a
> top level maintainer" and "better you than me", which makes it very
> difficult to find a helper. This discussion isn't helping with that
> perspective either.

+1 on both Steve's observation and Johannes' entire mail.
-Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

