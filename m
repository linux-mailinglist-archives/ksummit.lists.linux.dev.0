Return-Path: <ksummit+bounces-2585-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B3C48678
	for <lists@lfdr.de>; Mon, 10 Nov 2025 18:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 227FB34AE0B
	for <lists@lfdr.de>; Mon, 10 Nov 2025 17:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07A92DE6FE;
	Mon, 10 Nov 2025 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hKpzEfqW"
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8102BEFE4
	for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796662; cv=none; b=eK+4XoOdWSeCeXVhJEPma+C1EA7swwg76Q0AgE+4ycGWw460P/PdMIgDis9sPme+DZMQKdwaL6zG5P0XSVzKGel5VaSs33BnkdUPx70ZnDUSXG5tZFez+2ovMzDJWy2QNH5nZQ7YZW9ggffLbjgyiWj/6BzxqqiYTkP2qVMR3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796662; c=relaxed/simple;
	bh=aJkXTAL7hko1vF8GGGqXUOq9IdfVkF6MkoKhNUkblxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCb9YCJ+0RMoE0JLgSOuijs1upMvWMstUa0ZVdEsJPNmZzEspAUOGJBlziqiCiyL6gVKPW77tIDGqr7RSWzWmiDdGTc8xhZNzaSroNNJ7xdk7SBe39aNankFOGDcndz+lt4lY5fBN2Mrc7BmvGV7Gdit9viLyJ10THdr6qArQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hKpzEfqW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so5012272a12.0
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762796659; x=1763401459; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aCzk/qbLhCwNEv+1dx5n8o3k2LQtS9clijGkZLAmnGM=;
        b=hKpzEfqW2PG7ctVrZzNrhzNMTpT03PTxAert2DGPrCdqDGuDHIvr8fsSWUv0MgseAo
         sNY4LZWpdZJzbL4ZpzRMU97KF6q4Ag5/F+JT/2Ea+tckCWPsjgzO2fLQinRMXqAlZvsZ
         HaAWvlZ1weSZMup+5JfqGw8z2ROtPrbUUOhK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796659; x=1763401459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCzk/qbLhCwNEv+1dx5n8o3k2LQtS9clijGkZLAmnGM=;
        b=anDUZIaZbFbxBeH4RREJItvRI10MkM5sdTco3AVt4SyY23twfUBwqTldH7Sy9FeZfd
         2KWkPjp4OOHo9LgaVVxIdRlyn5+YLhxB7m5umFGYDAbq2SmG1gnjRjlYK75tU8UFw7kO
         n3vSEeHcEd4eQLS6C45QKZQyL1UXeBRVSKJ5szodqTCVs0aBAkbgSwHQgzwjGoMWlbyJ
         lSD1MgsLDsYxZnMx4fHutNy7+GydgR4JL0uOq06Fy09gJAKJUfl+EqlwwTaSp5LVLI8F
         KdwfUiwQNPFi/U5JSBRAvq/QrZb34cj4LsSIFIVD8u4R9u320lxirs3vHF+6zqef87wV
         f0sA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbfZqUPBKyWN5hudH2vs0eBRXLKMn5Kc0sShC40i4RUySVvg+1K9N5mlNNy357Fe9EzHinvfH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/82hCq+HGq+X/HMknbkp40EpNt4jd6MPF/gwKFnS+kFfGCmht
	mkLOW5UyynKHgSoOQgaOUXVEkermxy1+uykKj0kVa22BEed/UrVIlyS0CHpfR6sQscWLrnFBpKl
	xHZdIsKI=
X-Gm-Gg: ASbGncsV4aB+uMzd4BF5fnkurStzrcjl/fZArE5ce48WdQfp6CqOUGgMrClwjxYek5N
	0f0B41N2IZbEiB+P4s+FZLq8dQf9S3TbZn4yEsoX1KzRKQkYk0lOjT3BfBS2S1a1FbBT4f3149s
	5zF/gQUvwrsYdjz+qZy8g/snVM/1bP0xaRPnczI9jKT2w+JuxzyffBCH8Welky7VBpjaGvk6JB9
	128rqC/J7RCQ5cSv7ocR9tJ+ixqBr1HSERbMCdGXU2wHCw+T3AixkTGh3hwMRrdkr6ArhBaStY3
	nA56UkHD+c+vDDS4e1JLRpFyXCrnpbpyQ0hmJjhyxGZGBUUEcdgK/l0Clht5zpxm/LqFW+91r66
	0t8F0B7C+I8NqTnodhPO5aGeDhFRLy8yraNkCB5kGNO9radu/yGtoRXdcYwChYPMwHit6Qem8k3
	joG8mnxacfbDTxfX4O4C4yVl2OAXsZztLISQV0TPf8siaL7oXufv4afWCscY/tIm6/SRy3ets=
X-Google-Smtp-Source: AGHT+IFYPVvX3ukKjMd3p0sulU8oBgc4T8Ccg/K0YqLHKbB3aO2OqUlpV2R9oB23/eOrCMAMrSn1MQ==
X-Received: by 2002:a17:907:5c3:b0:b6d:2d06:bd82 with SMTP id a640c23a62f3a-b72e0309ea8mr1169211966b.25.1762796658615;
        Mon, 10 Nov 2025 09:44:18 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d0f3sm1200538366b.48.2025.11.10.09.44.17
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:44:17 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72dc0c15abso437132866b.1
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 09:44:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/zpF4owvJkvxsgOfDeO7VgtAXgXHpbd3atrik5FvE0EU6nKpuYLit/hTQQqF+T1EXOhus+IkC@lists.linux.dev
X-Received: by 2002:a17:907:3dab:b0:b71:ea7c:e4ff with SMTP id
 a640c23a62f3a-b72e028a45cmr778784666b.6.1762796656727; Mon, 10 Nov 2025
 09:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com>
In-Reply-To: <20251110172507.GA21641@pendragon.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 09:44:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkg_IidkR66xZb4S-deqo35yAvtxVL7xdWRUcGFEchFZ0rJJKEs7XvoLmY
Message-ID: <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 09:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Mechanical transformations are often performed with Coccinelle. Given
> how you mention that tool below, I wouldn't frame it as out of scope
> here.

Honestly, I think the documented rule should not aim to treat AI as
anything special at all, and literally just talk about tooling.

Exactly because we've used things like coccinelle (and much simpler
tools like 'sed', for that matter) for ages.

IOW, this should all be about "tool-assisted patches should be
described as such, and should explain how the tool was used".

If people send in patches that have been generated by tools, we
already ask people to just include the script in the commit message.

I mean, we already have commit messages that say things like

    This is a completely mechanical patch (done with a simple "sed -i"
    statement).

when people do mindless conversions that are so straightforward that
the actual sed patch isn't even documented (in that case is was
something like just

   sed -i 's/__ASSEMBLY__/__ASSEMBLER__/'

or whatever), and in other cases people include the actual script
(random example being commit 96b451d53ae9: "drm/{i915,xe}: convert
i915 and xe display members into pointers").

I think we should treat any AI generated patches similarly: people
should mention the tool it was done with, and the script (ok, the
"scripts" are called "prompts", because AI is so "special") used.

Sure, AI ends up making the result potentially much more subtle, but I
don't think the *issue* is new, and I don't think it should need to be
treated as such.

                 Linus

