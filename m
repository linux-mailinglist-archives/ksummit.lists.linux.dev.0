Return-Path: <ksummit+bounces-2663-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B0CACC79
	for <lists@lfdr.de>; Mon, 08 Dec 2025 11:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F6A8305A133
	for <lists@lfdr.de>; Mon,  8 Dec 2025 10:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AF42D9EE7;
	Mon,  8 Dec 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hykYPE7o"
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E74A07
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188129; cv=none; b=mL3fHx4hmI7ccRCzuqXzpEzmgaHwqm7Wb0emKlmsScmNUS6xBsjr0J9GiBS9j/IppwG6AOiCyDZJa/BHT8aNcFl6Y4Og1yV5eUigpXxEV7CgWkxVAzpqFGIxMXgK0uMsyc5m07GmRfGZ2wbUvzLUUEZklqSyoX3/fr44VTsNW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188129; c=relaxed/simple;
	bh=2l99jHxIiobSQczRQ9v349QEi4+VvQaQIX0yD21rTpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXIQSaTrWwsDyiqxdJBDg02C0vWtUHF1VPOPzQiFWbEQQr4gYizYkDojroaZAiEdYhVubDDua45XBc18xBg8WEGgjoQ0vzMbXz3sgLQ+IyYNv2J8QzRHRUmqddfeOqcWNXRi7wgAvG8samrIUI/cdTIRJh2ibJ6fz2MxMNyCviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hykYPE7o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47774d3536dso39962455e9.0
        for <ksummit@lists.linux.dev>; Mon, 08 Dec 2025 02:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765188126; x=1765792926; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QN5qbyaGksP/i/Fq1G4UW34jvnUDrWIpPXvh4H4/8o0=;
        b=hykYPE7ojQ+DEBRor7sjY8LHyv8mmqmppptGG5xhq2ZMCCLyVW4LhvU+i/CLoKyssC
         ajgjgLbuvA0LkCI0KGSYvMPAESygkUdQ7xZ7wzIVO138l4ER1HYqGxwy+1Ij8tM0PC/V
         aE5DW8ehefPiHIJSLRO4Q0j4kl9NSFQTMMPzHumequM1kyTphRIDKa0pBQpp4qvN7RTA
         axyioFgMMG5qchK4l4tsgWAUoQtRfQPU2GXuilDnSiiigfenOeAsOq9QCGlMJYKZcxtF
         EKP4gW/aXjhs1zbhiMcsjMZDfaWpNiIO727AzVIfTCfxwJOxiiRbMXHVn5K9052XiYGs
         4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188126; x=1765792926;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN5qbyaGksP/i/Fq1G4UW34jvnUDrWIpPXvh4H4/8o0=;
        b=hPaUxESENJbdqvE7QDRI+PfrflFAgF2DLtbuvG8J7BkthuuHXeRN7XcFkOQ0iLtNhP
         t3u0j0vR1YSSvQCaJ4w/rCPfFHFoK++ayCBYb9oOYNkk2Er0YNICvy4hhkCvCGpEX78p
         QBMs9I0ZGd7/bpXG8lr+/9UFQj5/kqoqrurKa0hFlwctb7sK+HHosJE1jVo8Yf4m0HRW
         6WHSbMxsAVBuTzD2f0xXykYt2WaTzBgdSvksFaBBcPCyu/hrZ86UNrqXkYS8Y4oDmpVj
         c2BnF43mQvCWItGHp0bzQ3MEC2oGzZpmB/JsCNWayn4AcTXxJLtwySSdJKFnqVnicx6a
         JXTw==
X-Forwarded-Encrypted: i=1; AJvYcCWO8172ucLvysHteWQjvx+yjoW9gIHdFS3C+ifu59nPzE61y9GGKQZAYhCxg4nPyPnT6kaA4zLF@lists.linux.dev
X-Gm-Message-State: AOJu0YzxrbL10Td8NQgTz081benAgLjmHalcYs6ZJtW77+3oeRZquAFF
	1AFIv9nGT4wxmyr5OQCWtlIezHUJfvWlLDkJZLaAejjQ5HY8ZVgnCii99sPv4Dv+5ko=
X-Gm-Gg: ASbGncsT2ebxlvaaqgNWV73ecHssweN63UmpIT+SwIlrS+w2D3by/1cOcqPu7g5etla
	jXcnmN/C5h5f1awyvg3GSSJKyjuBwv0eUzSF4dW0fTFsjPzG5oT3Mla02hWsKnMMXNTQAz0odBN
	9iu7685m6Xo2Hpmajh/PIvJv7I+VcAALUsRKb6vbuDusInBQr+y27sUCDnT6LdfnJFHiHE+LMKT
	ZSm0ciOm3KglKlRsxOYMRxg8zcHF4uFRL6Cs6eIBKDdLxz+jaKkgJkt4s+l4h2qc3DKuw9ADMD9
	+gSlEwsTDXpROCN19KN4F3+wLT/jZeDNQyyFY41DNo2CQuoyh2ytC9gBhNlSMG0YnG5PiHBqTHq
	U1yc8uI0Yc6162HORSou0ErtV9XSYVeuQt5NbsM59UbPvieGrO8lakTiEcJkW3Ky/PS22zHRoGE
	cHmlyEvcyGuCYvYCt1
X-Google-Smtp-Source: AGHT+IFVjSA+L6mVRPBjCauvsRE3jIja3xPh4lZvjGcaojdkx22S4iaVjJPoEt6UFGMyGZwCFbIkpw==
X-Received: by 2002:a05:600c:4813:b0:477:5639:ff66 with SMTP id 5b1f17b1804b1-4792eb7198amr91430365e9.13.1765188125492;
        Mon, 08 Dec 2025 02:02:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d222491sm25834145f8f.22.2025.12.08.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:02:04 -0800 (PST)
Date: Mon, 8 Dec 2025 13:02:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-kernel <linux-kernel@vger.kernel.org>, ksummit@lists.linux.dev,
	Bill Fletcher <bill.fletcher@linaro.org>
Cc: vincent.guittot@linaro.org, lina.iyer@linaro.org
Subject: Support needed to continue Smatch work
Message-ID: <aTaiGSbWZ9DJaGo7@stanley.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have been doing Smatch static analysis work at Linaro under a larger
umbrella project to do with Linux kernel quality but unfortunately that
project has ended so I will be wrapping up at the end of the year unless
we can raise new support.

Smatch is an important tool for kernel development so hopefully there
are enough companies willing to support it financially and I will be
able to continue.  In fact, there potentially is an opportunity to
expand if companies with other large C projects and want static
analysis.  This isn't something we have explored very deeply but reach
out if you want to have that discussion.  Please contact
Bill Fletcher <bill.fletcher@linaro.org> for any inquiries, either
about supporting Smatch in the Linux kernel or about other static
analysis projects.

Background:  I am the author of the Smatch static checker.
https://github.com/error27/smatch

In the kernel we use a number of different static analysis tools with
different features and goals.  What makes Smatch unique is the flow
analysis.  Flow analysis is basically the logic of saying that if X is
true that must mean Y is true.  Smatch is the only Open Source static
checker with this level of flow analysis and the only one that does
analysis across function boundaries.  Being Open Source is important
because it lets you write project specific checks.  There are a number
of commercial static analysis tools that exist as well, however, for
parsing kernel code nothing else is at the same level.

This is borne out in the numbers.  I have been working on Smatch since
2010, first at Oracle and now at Linaro.  Over that period I have been
the number 12 bug fixer with 5568 patches and the number 2 bug reporter
with 2587 bug reports and almost all those fixes are driven by Smatch.
Smatch is included in several subsystem CI tools, such as Media and
Wireless and many maintainers use Smatch as well.

I like to say that static analysis is not just a product, it is an
on-going process.  I regularly review CVEs to consider how these bugs
could have been caught earlier with static analysis.  Also the kernel is
constantly changing and adding new APIs.  Without continuous updates
then a static checker will eventually bit rot.

An important part of what I do is review static checker warnings and
filter out the false positives.  People complain about false positives
but in some ways, with static analysis the false positive ratio is a
knob you can adjust where you can either have very few false positives
and miss bugs or you can have more false positives and catch more bugs.
Since the kernel is very important I prefer to have more false
positives and then manually review them.  This lets us catch as many
bugs as possible without annoying the developers.

Especially for cross function bugs, you need a human to figure out who
the correct developer is to handle an issue.  I've also found that
adding a bit of explanation to each bug report helps developers know
how to handle them faster.

To be honest, the work with Smatch will need to continue either way
because it's really important but it would be great if I could be a part
of that.  I still have a lot of plans for changes and improvements that
should be made.  I'm hoping there are several companies who could
support this project by paying a proportion of my salary.  This is
something that Linaro has done before with other shared cost projects.

I'll post again closer to the end of the year to let people know what's
happening next.

