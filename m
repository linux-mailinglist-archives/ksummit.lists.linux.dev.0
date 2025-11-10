Return-Path: <ksummit+bounces-2592-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EBC4917A
	for <lists@lfdr.de>; Mon, 10 Nov 2025 20:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D49188812B
	for <lists@lfdr.de>; Mon, 10 Nov 2025 19:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C199A337B80;
	Mon, 10 Nov 2025 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LLeKGch+"
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B9335BAD
	for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803383; cv=none; b=qx6Vv7U8Hi8HofYXAO529Zl2dqra3nx/TMyIHPkMJZwynMwGvf2sXRNbSDMXhdQzwY4qg9eNMEi0GEPVH1XykenLpqeFjFS+AQp6gXYwnsBcomJw4VeOfadDR1BzgX/Tn0Zdobx1cCV+mk08rMCgkQ4bQs7q6ImzcR5rgyOIMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803383; c=relaxed/simple;
	bh=PxpwsZjpe3I2aDg2u+M53UXL2FPgJLtktslzgZjb2us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIUWrgHd6cmCmGqDYSG1jmM0hy9r2AWUuuLJimZ1uJgF3bvkX5te2sCxkMSD3Vl4SOt+RM6UMRF/+/ql2kt+v2hKxnqaa8uTIKA/7Tmp36OkPKVuwyuGeNDu0aN9QrpOryPiju+unYXphImGjeDzZUWmZMyQkra32nHSuTYA83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LLeKGch+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4736e043f9so472448066b.0
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 11:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762803379; x=1763408179; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99/bEi2ImdlU2nnSwwuvCx8UfBwiGJABIRJHpSWJmF8=;
        b=LLeKGch+Rb3vWws0jjXvax0X4gKegABc9fVGWSQNPFSdNNTkxOhEREdlUmo6TlszSQ
         DgxeXcI3ONtwG6i8PknjwnQjm5XUEdaDgjn28dfPaMLCapLFhV6b1ZwaUrKDOVe0kf66
         /RyPvkgSkzXbIEdQ49F7MYhdrC4TIenFX+nZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803379; x=1763408179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99/bEi2ImdlU2nnSwwuvCx8UfBwiGJABIRJHpSWJmF8=;
        b=G93tHTLkVpF8UtmT5H5ETWiOgPiigIs8Qa6cIm3FWtoIX6JOs0rxPQAXcIDSEnQZ/L
         mXluCZH0NxPUgEIHgHsOBrBoyBGTeE0ENEwLGuUgbDW2cV1MNHwfjbyE0huR2/0/wPtU
         UqbYmbtVUhYosswFEv5GOGwo1pZ9LtH+US/aiNzqZzIhn8hO0NNzfT32J/K2gwTDeKQo
         +Tj0/B6ZZgQPMWZBP8B8elwymiHeecHB2KF93Qsydw3yvT2Qu+Eyn5O/DrvG0H0NlmYu
         eQ6RcoRJtSoFsae1XrV5qcWubnyByuNVqP6z1L0wBdbJRXVIgrb2ayZhLsKLvtZpne6/
         iPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa9gDUv1lHGIAR6TZsrO0S8RI1ukcOFw4zRbYvzyfOOyA50RM8qZ8nNcUgx/JLSd6lMhVgC2pk@lists.linux.dev
X-Gm-Message-State: AOJu0YwwNa0J2rvKUevOr07ec+DpK8q0ro2vb46A6NA7Dy9BuK8UbThL
	YDP1uWJgvrLS++uO1E1yiAtc/57NOGMa33/8m9WwD+uZldsKie0hVhMVlbQ8oFZcmBEof1Ff7kk
	vd1YzS/0=
X-Gm-Gg: ASbGnctw+J5kPQYzTDD46fPv+iZtWOkhcpP+Q9APZtEpyBXzeD8ZO9zGTodJzvGkqfY
	6qC2i1Ali4e++8dFQ4QwVb0QqhQtkVKtfPS8C/9E4BSEaTboUfo1uwORP8q3FA3n46wgGg/qSwT
	eEA+exKPNGzEnC1OK5TgxOiLeeNOaTLnl/mjRz0NU+GrTzgUywJJR41FFeoqLXlxlv/w7+Z62lE
	ELS3ALX3Exw/BHyPlfC/MrgEGQVjTpCCmKEij600gbEMgW53MAM+dCFtqW1NlibJye0+P5TzHBF
	cdR4OQOXcMj7zPIGCn4QJUKGyoYSa/nHfSPWTvNJIg8agAKH+q9mHMy1VeW2vD3jNkaLF5mXJQg
	+w//8oTlwudu/bDvgvgOWNx4YCeGSjwYsbM1laoLKFiqjIhyTnVjPgeg+7XvOXOuqLNwRN+oaPy
	RDZHbiaaEcJD6qy4otxmlTA/RCuXmIbius52fUSrm5DaOoL8SYeg==
X-Google-Smtp-Source: AGHT+IHBkarLj0EckytH8MNmFQP+DZnDCh+6aQ8VXSM8obT7UEqywvBAfgewhP49AFhnqcZ3MPP8DA==
X-Received: by 2002:a17:906:6a11:b0:b72:5bdf:6093 with SMTP id a640c23a62f3a-b72e030473bmr752566766b.23.1762803379280;
        Mon, 10 Nov 2025 11:36:19 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf40768fsm1160701266b.23.2025.11.10.11.36.17
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 11:36:19 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b72dc0c15abso458719866b.1
        for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 11:36:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY3wLdhSooXyuwGdc92687W5QQugJ9ilPkfC/o3G5f/K8CWkrOPi8X66y9hGYUCA0Qvpnx12dl@lists.linux.dev
X-Received: by 2002:a17:906:1355:b0:b72:eb03:9322 with SMTP id
 a640c23a62f3a-b72eb0393acmr666007766b.15.1762803376534; Mon, 10 Nov 2025
 11:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com> <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
 <aRIxYkjX7EzalSoI@kernel.org> <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
 <A274AB1C-8B6B-4004-A2BC-D540260A5771@zytor.com>
In-Reply-To: <A274AB1C-8B6B-4004-A2BC-D540260A5771@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 11:36:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=whczwG=+-sAzoWoTY_VOwdFH3b5AkvQbgh+z98=p1iaXA@mail.gmail.com>
X-Gm-Features: AWmQ_bmIQjBbP-mWv2JFFWotDHPz9N5F1IH58uHH12wUDflk5iKlAp9e5SKychk
Message-ID: <CAHk-=whczwG=+-sAzoWoTY_VOwdFH3b5AkvQbgh+z98=p1iaXA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mike Rapoport <rppt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 11:18, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Copyright reasons, mainly.

I really don't see the argument.

The copyright issues are all true for all other code too. In fact, the
copyright issues are a thing whether tools were involved or not.

Copyright is *always* a thing.

We have a fair chunk of actual generated "new" code, whether it is the
millions of lines of register descriptions from hardware companies, or
it's the millions of lines of unicode data.

(Ok, the unicode data is just a few thousand lines, I exaggerate. But
we really do have several million lines AMD GPU headers that must have
been generated from hw descriptors, and there we didn't even ask for
the tool or the source, just for the usual copyright sign-off).

I really don't see what makes AI generated content so special.

Yes, I think you need to specify what the tool was and what the
conditions were for the change, but again - none of that is actually
new in ANY way.

This all feels like the usual AI hype-fest. Because THAT is the thing
that is truly special about AI. The hype, and the billions and
billions of dollars.

I claim that copyright is no different just because it was artificial.

What's the copyright difference between artificial intelligence and
good oldfashioned wetware that isn't documented by "I used this tool
and these sources".

It's just another tool, guys. It's one that makes some people a lot of
money, and yes, it will change society. But it's still just a tool.

                Linus

