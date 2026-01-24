Return-Path: <ksummit+bounces-2813-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIIGOXSqdGkt8gAAu9opvQ
	(envelope-from <ksummit+bounces-2813-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 12:18:12 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A67D59F
	for <lists@lfdr.de>; Sat, 24 Jan 2026 12:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3A54300B466
	for <lists@lfdr.de>; Sat, 24 Jan 2026 11:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D913F237707;
	Sat, 24 Jan 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcjTyPWa"
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D43194AD7
	for <ksummit@lists.linux.dev>; Sat, 24 Jan 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769253483; cv=pass; b=qD0LTqItED1Nv16wY6OSoFSn2nib9/xkUpcR39wvubacc0Wpmrlbqyse4xzJX8YBTq3HvOwtmzGOxs5aA2+PVGTEjjN3nqmC9yQYSLdmCPJ+aCDvnon9hqe4D2iuKIuDY/LYRuheYL8LVDKuoeWYiRA2f6JSaLGQ3pWHbPgWzkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769253483; c=relaxed/simple;
	bh=mtULM1QlXVjjoLujkXuZMnG/77qoNhxnmjUSlKrHAxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcUUl/OP1pk98Ibo+JQJ87IikTfO3b6BbSmJO5dImiP5vuA/07yZf5e84IcAGAcJC2z+bYIeY5OZyS9g9iY0T28PdxSHLIf15Br6ESUXBzfUOv7gtnLZNnxwZxoLHN8XnKCLqNXsnCzjHjLDSJLeQ3x+vvbYNiMWjzFjUNn3u5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcjTyPWa; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1232c98f98cso235855c88.3
        for <ksummit@lists.linux.dev>; Sat, 24 Jan 2026 03:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769253481; cv=none;
        d=google.com; s=arc-20240605;
        b=BPAhTFHHRgW6GpvFOYdfeVqOfoFuQemwKpSnMK7KeKkj2hEQxwrUto6JPuNOjmqPlp
         l4T+EkMitdfcXiGIVXdpQSGCQJfIV/qmZLYn1yGwguHEsadqq7K8xc/yrmHMLmw8p5Rz
         X2OdijPML/tjqTnhEjC0SIMSaYLljWdFG+SsuQCIBGpgt/pSa1gEP/SyuxLRK86PVW34
         cE/yeiCjfkv+OKUkBfEZKLvrXjELLaZwMBzASCwt/x7V6lFWqFG0PFdxpj5boJSmoh8X
         xX1ye0kAf6atr7cw4NUr0FIoBfnhCc9DGexEYfnfj4gDppu45a+y4Vz1h/HIJUxGSy4H
         V2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mtULM1QlXVjjoLujkXuZMnG/77qoNhxnmjUSlKrHAxk=;
        fh=8qyu4pkft+VJmaJP46xyTnKn6Io39DMg3ns36k58s1Y=;
        b=WZK5uOXsaO7kJV5C747bjybzHn9mCZUTO4d8TG0IpBKkeqkqtES5kINQ1RkdgajW99
         xmg0csBTPJu6zjWboZ1VXdcSAGPOZI5ZvRPEPFLM0cj6pkHOYePijL96nI9nSXLDx5O4
         XnZrpdVb9V5I8L16yaauvWe3cb7gFoqqSME0JXr+V/8zRPRf9yc+g+cyggasG0Kd/8q5
         DMSHqRoCjfNvJlgpnVMiC8TRJtxhYxzKGNXC29J2asu3o/IBv9If3dWPGpqjX7CG+gYy
         11vFC2l1gQyHPnC5xwsl1mX9RpEiOFIHweStlBU/Jb9lGkPU80GIKKlFW93RNPIcQucO
         QYRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769253481; x=1769858281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtULM1QlXVjjoLujkXuZMnG/77qoNhxnmjUSlKrHAxk=;
        b=HcjTyPWapzrMYxRrM8K5geOGddfMc7tp3e+lqOIKjLZCJ24tGzrzACwr1JVrrY24t6
         Ox1apQFh0hXS1TdGn2NE2CfFBdhU0KJzOcmkX9EkUQdJEbudnlZIp7LGg3wQ6PlVd56x
         FjLO+TjW1lbOyQjV8xzdQ4mr1b052FQ0qegIbgn3Ucp2xTZZabSW/PZ+04IotaeqXBZx
         VYXmA80CW1Yt482Kz+IYXdZwyGa02U5Dp/BfXymr9K3+2E5zpQuh19v2qygtEqZ3sZHl
         q8CpbzuE0Lp2T5MDvWVpnxET4Hi31+y7gOmIZTgs2bGoNgAR+cAR5nXb1YEBf2WA+CD2
         rOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769253481; x=1769858281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtULM1QlXVjjoLujkXuZMnG/77qoNhxnmjUSlKrHAxk=;
        b=D/ow4u2UseOsPzmCrJ9UIR7QrcwaamDyVPrlV+dZTKpkmozIoOA6MztDHsz8wXODN0
         mqBDJUOrvh9jfWvp8h+P73Sd11RDG3hj5bFuDfHZy2Q0wBJXBFb/AzIzF1+UoUG9RB+d
         EISltHaoCg93XCyXDN4mrAqOPYUWLt7lig876WxJiVopT+ZBshZPdrhsM+Ye70NQJURt
         hji8ZtYp3kH2goddfS4LbY8MMuNWM/nn0WPvOglh02ordKSyN6OKxhpI16/go+oFscKP
         fJgFy2iLQVUk9xP55g7cjpghyAG2ev69jfhqi6wK+ZUZ3AOzunx919R/zvovVfQcZ587
         xpLA==
X-Forwarded-Encrypted: i=1; AJvYcCWwmt6DsjmG7TyMIGOHjRSkVg5VCwSGnQv7fq6J62fquGbBa3YY7UgdCP+3VyNgKe44/rTQsS8D@lists.linux.dev
X-Gm-Message-State: AOJu0YzuDXbj86zKgH02N7funtvzTL51n6Or7hztC+JSURs4mUE0/NEn
	iWnzNcZ4ztyI+85V9Y+MZtI5RIoiBWrCpStcBMYGt7ASXg4VhsymgTBpaH+fRhwe4fcGvsrH7mT
	F4zboStIdj+pD9GJpum3gj6sz4jWjAQY=
X-Gm-Gg: AZuq6aL51u2hzblhZL6VTy+AZ8INYUk0QDpd1G8o/TkZnoXvZRlZ1ugPbcUhtzMEHgf
	CoZp21ZX/2FZHHHLGd1hT+46DRN7M6SjL27zPbw1b239BzF2+HFtWwzV3qwiW9OgdzIHsecu3E1
	V5i3xqaY1a3IKPe6FpuoX+oYOUKQNM1nexohKywo0O3M+SJ9ViMA6UVwk9OuX3Fxe5KA3AF7UVj
	K/tOnqHfhV1c8SbZ9oxRZjnMuKqmACpgT+HplEt6u3PpG6qksP2JAF7J4Q2HEbRdzLhviAjoCyn
	kepPWJ35B6JDPSj2Xjq4rN/il8tjrCNwmCnmI3TnCy7I2Ayelso5EG+EglhgrUkxS65xB70kkCL
	z/JTaLOAbGC+ywuUnA4yLbvc=
X-Received: by 2002:a05:7300:ed0e:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b739be7336mr1561870eec.7.1769253481149; Sat, 24 Jan 2026
 03:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260124012256.1856709-1-dan.j.williams@intel.com> <20260124082939.40715e13@foz.lan>
In-Reply-To: <20260124082939.40715e13@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 12:17:49 +0100
X-Gm-Features: AZwV_QgqR95O31mgek4Pcw6u09QsUxeA35ZyKtfrFf-yHR8jkl1xc8F-czDh3RE
Message-ID: <CANiq72muqOW=uMwtAG3753v6fkakXSO31zy2NBGd6GH4neFewQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Project continuity
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2813-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 4B7A67D59F
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 8:29=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Also, if there were no kernel summit in the last year (*), TAB may not

Quick note on the TAB elections: while they typically happen
during/around the KS/LPC, it is not a hard requirement, and we briefly
discussed potentially changing that (unrelated to this document).

So if a KS didn't happen (or was moved to a significantly different
time of the year) for some reason, then we would likely need to do
elections anyway.

Cheers,
Miguel

