Return-Path: <ksummit+bounces-2578-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D6C263C9
	for <lists@lfdr.de>; Fri, 31 Oct 2025 17:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654CF1894722
	for <lists@lfdr.de>; Fri, 31 Oct 2025 16:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE4E2F656E;
	Fri, 31 Oct 2025 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="TtMOnMjj"
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333023D2A1
	for <ksummit@lists.linux.dev>; Fri, 31 Oct 2025 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761929488; cv=none; b=ccoacUoHCoJuxgC1ji1thVAqzarP4YfBTBOhDmvqof5Kc7Ptuvd3XsiyU4U5DQQB83XpG4sPn8O7CgD4+leNIUSgNvT8YZRM5bH3EJHD3a39yUc0da7q4IX+Kjyf1Q1Btf+54+YrOuSykhOHGhTbehQulCUSJU2BMo5w2S//QEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761929488; c=relaxed/simple;
	bh=DEKnw+DGuTGilCc7ETV+vre7OdHv17FEN33Wv/12xH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eY0H+yzLmhfHwbQMep9gCi9WQ8BtCS4Rn+FMb/8tgukLfcx8AipdGFDz/HsbdrKMYmdpnrmnJHDcPplqbi1gzsDAkUMbInqoY+MZLih3CdQODNwzPLCN91TQtPKzDkUzacfzgcSNi2mVLsO4jZMynYq+WLfsLtrSE8SCQtWpVJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=TtMOnMjj; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63e2cc1ac4aso2416533d50.2
        for <ksummit@lists.linux.dev>; Fri, 31 Oct 2025 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1761929486; x=1762534286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns8UeACLeCZop8j1njC8hkx9VBcNQ9+9zqelcCYggO8=;
        b=TtMOnMjjBauLPWIQzWhICS/Tm06BkZxq8JcQkZq80GSZoblHmAt0St6Iy7T7ZYLlGZ
         WDur3i2zPQpzqIahtsCJypLkEe/9vzqspKsaWvUK5YtwpD02i3paQutaAua8Np6IObgj
         7cdB+FVAbyoYC3ntsdwKQ37xeieXjiNsON0gJHJLypp4ntXW5yJ3INl43LMrlibTUpKn
         9rxZlAifXPYXyAQzVvLjVsrqy/D+O3XsL3/kiOwFehASuDEJnXY9POSogqJvIleH+62M
         hEnzt+wdIi0atyaFAM7RYkV6rjuIAVTFstlhgkF53UiAwKquzGY90sykpI0tbqIvvKzS
         DlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761929486; x=1762534286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns8UeACLeCZop8j1njC8hkx9VBcNQ9+9zqelcCYggO8=;
        b=At/zK7XEhsg9QemzbU/mAgB3cl+RWciciDxKJVS6y4Wx8K9g6WoVeCCOQzwxQVt9J6
         dOJRWEYALs5EmR9tfMInTHJaRE2VEebt5F14FlD9xdiza1kg6s0lJZDnJiDsl/obHG+0
         u0D2uUtmYkMZZ84z654QRwZyG7+G47NQqbSK2YMNHxnPuE6BfZAZVimbIeGxHu/K1k/T
         g1jc+lFUWLVsIgan0mo9c6oNyygHve+/3dY14Gx4B+s4CGu/lEi8uHGWleHNE9ClbE6j
         2mS0sAWqeWVnIQoNfXgWTOhmzMtVoAiYbL6sA/aaT6zzYMr3wHkTYz3tJ274UYZPUv4q
         gDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGEbOM4UqUegIvee7HgQPyJE7qMBmuhysXn/xy1iB3UtdkiNoxZvlKP/znAEI3HEkNIdfEx0lC@lists.linux.dev
X-Gm-Message-State: AOJu0YygpOAyACK0UeCmR5+r8sgk1vvirUfBi2bUV2OrlWQ/ulVFCLnP
	aOarF2LPbVZ8ovOIjM3uUfNo/z9GPNh6yVcQwJEbTl9vv+QQKMkFHgEqeNMvgyXpCZk=
X-Gm-Gg: ASbGncvXJAGtb48+mTudAA5w0MCDkBe1wLLktLfjwYjd0F3zb5kJZtkm4rXk6gO9NXf
	jAVoT+6wQCcZ9kTDYIcnYar3LHW0Hy4zbLq1Ut4IFFg7r0+08HolW7MEVRW6I1IFlMUQ7raogyv
	ek1D6eoDEnOEkyZ/PlzkoXfKgsmjga04lpjhlSmtQwRS+gXgJt3uxkFNmsBj0PtjbPC33H+Feas
	vIvqSbRHwMswEPj7U6oOhcHV24HehTo3jrT8p4Upbly6AG07HIS4FHYN6dJelTaJfA1Lk8IHEzO
	iJXKE4+Efen/+VrNTwWMuDirssY0m/YwyDnQDVpnt7RIqWnBE7E23Ka20kRxFF5xgM/NxJtlZgH
	eROT8VJa6pIt59d6d6MyuC4bUc7CzbVd8EXdWgiIQ/roQfYFQamRiSz0OjRHKSpjXYRFEIeR5BA
	3+hcC1DDnxDUcxZd+8gUhF68lIx7lKwyW2Twk6SqPvAT5H
X-Google-Smtp-Source: AGHT+IHf66+qNgvfxZUuRD8yRa3bPEKHHTsZmeEO31yz9z3d/Srg3xfvf5e98dLNbyESpyG0g1PRLQ==
X-Received: by 2002:a05:690e:428f:10b0:63f:2ec7:94e5 with SMTP id 956f58d0204a3-63f9222f8efmr2778642d50.1.1761929485827;
        Fri, 31 Oct 2025 09:51:25 -0700 (PDT)
Received: from phoenix (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63f96a7a4cbsm590806d50.20.2025.10.31.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 09:51:25 -0700 (PDT)
Date: Fri, 31 Oct 2025 09:51:21 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev, Dan Carpenter
 <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251031095121.27abff27@phoenix>
In-Reply-To: <be5094b9-fb20-462e-ad2f-2b58e520b949@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	<be5094b9-fb20-462e-ad2f-2b58e520b949@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Oct 2025 05:08:47 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 08/10/2025 19:04, Chris Mason wrote:
> > Hi everyone,
> > 
> > Depending on how you look at things, this is potentially a topic for
> > either MS or KS.
> > 
> > One way to lower the load on maintainers is to make it easier for
> > contributors to send higher quality patches, and to catch errors before
> > they land in various git trees.
> > 
> > Along those lines, when the AI code submission thread started over the
> > summer, I decided to see if it was possible to get reasonable code
> > reviews out of AI.
> > 
> > There are certainly false positives, but Alexei and the BPF developers
> > wired up my prompts into the BPF CI, and you can find the results in
> > their github CI.  Everything in red is a bug the AI review found:
> > 
> > https://github.com/kernel-patches/bpf/actions/workflows/ai-code-review.yml
> > 
> > My goal for KS/MS is to discuss how to enable maintainers to use review
> > automation tools to lower their workload.  I don't want to build new CI
> > here, so the goal would be enabling integration with existing CI.
> > 
> > My question for everyone is what would it take to make all of this
> > useful?  I'm working on funding for API access, so hopefully that part
> > won't be a problem.
> > 
> > There's definitely overlap between the bugs I'm finding and the bugs Dan
> > Carpenter finds, so I'm hoping he and I can team up as well.
> > 
> > In terms of actual review details, the reviews have two parts:
> > 
> > 1) The review prompts.  These are stand alone and can just work on any
> > kernel tree.  This is what BPF CI is currently using:
> > 
> > https://github.com/masoncl/review-prompts/
> > 
> > These prompts can also debug oopsen or syzbot reports (with varying
> > success).  
> 
> 
> In general, I like this entire idea a lot, because I believe it could
> drop many style or trivial review points, including obsolete/older code
> patterns.
> 
> Qualcomm is trying to do something similar internally and they published
> their code as well:
> https://github.com/qualcomm/PatchWise/tree/main/patchwise/patch_review/ai_review
> Different AI engines can be plugged, which solves some of the concerns
> in this thread that some are expected to use employer's AI.
> 
> They run that instance of bot internally on all patches BEFORE posting
> upstream, however that bot does not have yet AI-review enabled, maybe
> because of too many false positives?
> 
> I also think this might be very useful tool for beginners to get
> accustomed to kernel style of commit msgs and how the patch is supposed
> to look like.
> 
> Best regards,
> Krzysztof
> 


Has anyone tried asking AI to use existing mailing list review of previous patches
to generate its own future prompt?

If so, how did it go and what worked?


