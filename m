Return-Path: <ksummit+bounces-2038-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC1B1B7AD
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE19E168E91
	for <lists@lfdr.de>; Tue,  5 Aug 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B317926CE0E;
	Tue,  5 Aug 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IYj9qkzc"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D299205E2F
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408326; cv=none; b=uUs+R6VF/CypsdD4tRLlZJJ6Q9Gb/y4g61DsKZoCqcDWuOfpcoVx9b3k3bDyEZS6toxsTY/In+JskaFPEyI5gslnjlq0NEXn6JOddCMvx3nYEjn7adhkZu6Fg2xB8YOWxrlSpbTNb1LxpSvLJk0pCYAoKlaqyO6a60VCLxVgxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408326; c=relaxed/simple;
	bh=2BIme8MCyZQlCnjcvSfO4OEqtOLHWS8pnCDGML9Cgdk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=Rxel3o0zEaS3TW+ax51CpCsj85TfATm07IyWLZs77wA/848YakqH9HRAVev7SeSuODlF15UPtq/it0eHU7kdPGcZXckq8T31Rf/G4mnBHWyRQ6ResXHmyJryuheOo46DwlGY+1elO818sKzCzLHDKqyPn04lMAkw5n9vDwxgAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IYj9qkzc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d44d286eso42955e9.0
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754408322; x=1755013122; darn=lists.linux.dev;
        h=mime-version:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e2GsXWQZ4S7sO6fPbz1Q7nVgLXn28F695n2rWTmuLw8=;
        b=IYj9qkzc+uSJa9bcdmR+cyveN+3FzYtj5/vizQEN15C0pNMxGoJuvIgxoSSjEIY8Ln
         se56cQJvvuRhkRo0lB4IHllLxnTw4cSDcMUWrA+/4B2CpR4Zjdo+O596BtCDxZghzYbF
         y5cmFKV5eFRN2ZAebXtVL5JhWLPrPmAqfzXHsS89cLZQzZsPe5arjbW02tbZMXo/Nntu
         apxTQDorMP/VzRpSkEOk9jcrKNZhpm1NDS/+6G46oKKRGj+v70OGtztB/CB89xY/GKl0
         VDxmfZGPiChhLgTVfaM+n1SQKzbaKatV+j423TAHDmphoNuY+wjq5huP3M/dGKADNBnP
         kLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754408322; x=1755013122;
        h=mime-version:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2GsXWQZ4S7sO6fPbz1Q7nVgLXn28F695n2rWTmuLw8=;
        b=THnHfTtJSqMJB4F9cMGMmaFqtd3PyL4LbDprdVwSOZ71QEUri89Gj4qJtNxzE8nEcZ
         n9JVXynnv9f0JsISPx2gsfa1J62siKL+qEr0J7/Gws6SWTQJ0kboCdRFGyouZTfMYZJn
         ic6qMnB1W5fGWxDPpWcD2eXBqQ8QhdXa97LalqaWZNNeupRoT+y8tRBB/w+MkFwIMaf8
         G1TRKxE1ny8d1Sw1855mQ92fliXAAvHt8x6zz8wQ/bi/xi/Bfh2JzIaUe5EBIUoUT1g6
         qoPlnSLEsLr18aeMiiVvJMKbVNMeEtslzpW0nJeezQ1yOUn/zfmVC3UrPGaD351d+w69
         Z+sA==
X-Gm-Message-State: AOJu0YzLMdlbN1He77rFWHmyQwwAVHoMKM5R/iZ/QrKIsUlY67Xcmj0a
	wjDn25jfkHiw9x4OhWGvjstCDbBJ/wIF2S6ZiXc3HKxrzLWOrnwhqF+SavGVnjBkSCVxVVPrSiS
	00/zo
X-Gm-Gg: ASbGnctfpKA1EYRtTG3rk4TsHg985rtqAJaGzQGbuCN0k1MRcOw/7uqEToc6H0eMas5
	KUForMLjRsifHXKvvQmxy3d+tf6+YPY23sADDGkDr1N5n0L8iErLTMQwWjicrsM3lrposqYmgNO
	DUTQa0wX2Sp1IvPm6UMn5XHHoRY02fV22jPo6A1GBYSECPETTbsAsj1oKhlykqzYwmi58IbOFDr
	znf5K+RMvOum1bdnvVX7YZqEfnPFPSD58YpMzDzuldpDCIsmOjOZPxTWjT6Kgp/JK9UJS3qD+Cv
	g6qLZM42jXaKOgN6YEAH8g03jTGvp1bdTHNVflT+TmaJ+GOi6w88WqzzGkGeEtN85QSePQ7gLZ7
	kEhGEH5chtjS7xCr/aG96XZojH6d7LN8=
X-Google-Smtp-Source: AGHT+IFqjuqEiDkCqJMb4rw6V3rkagngFRSLKeBGHeBaTPNMx8LypqsUOaksTLUk4Q8kCcPO5aEvUg==
X-Received: by 2002:a5d:660a:0:b0:3b7:879c:c14e with SMTP id ffacd0b85a97d-3b8f3255007mr165859f8f.20.1754408322268;
        Tue, 05 Aug 2025 08:38:42 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c0a952525sm4744569b3a.79.2025.08.05.08.38.40
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:38:41 -0700 (PDT)
Date: Tue, 5 Aug 2025 17:38:36 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.com>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This proposal is pretty much followup/spinoff of the discussion currently 
happening on LKML in one of the sub-threads of [1].

This is not really about legal aspects of AI-generated code and patches, I 
believe that'd be handled well handled well by LF, DCO, etc.

My concern here is more "human to human", as in "if I need to talk to a 
human that actually does understand the patch deeply enough, in context, 
etc .. who is that?"

I believe we need to at least settle on (and document) the way how to 
express in patch (meta)data:

- this patch has been assisted by LLM $X
- the human understanding the generated code is $Y

We might just implicitly assume this to be the first person in the S-O-B 
chain (which I personally don't think works for all scenarios, you can 
have multiple people working on it, etc), but even in such case I believe 
this needs to be clearly documented.

Plus, to further quote Laurent from that very thread:

===
I'm pretty sure every maintainer keeps a mental list of trust scores, and 
uses them when reviewing patches. Patch submitter who doesn't perform due 
diligence usually lose points, especially if the offences occur repeatedly 
(newcomers often get a few free passes thanks to their inexperience and 
the benefit of the doubt, at least with most maintainers).

LLMs increase the scale of the problem, and also makes it easier to fake 
due diligence. I believe it's important to make it very clear to 
contributors that they will suffer consequences if they don't hold up to 
the standards we expect.
===

[1] https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.org/

-- 
Jiri Kosina
SUSE Labs

