Return-Path: <ksummit+bounces-2956-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGbgCa/uT2pyqgIAu9opvQ
	(envelope-from <ksummit+bounces-2956-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:55:43 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9F7349D0
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CfgClVQp;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2956-lists=lfdr.de@lists.linux.dev" designates 172.105.105.114 as permitted sender) smtp.mailfrom="ksummit+bounces-2956-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2B5930EF67E
	for <lists@lfdr.de>; Thu,  9 Jul 2026 18:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8E3437459;
	Thu,  9 Jul 2026 18:43:05 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8504499B3
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 18:43:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622585; cv=none; b=E7xKA8uFQuviqU87T7DJAEDxHs559iZpcJ22UyvVGE+/ogs4+7t2JzrG2VO+wpBX/d5C8J99tnONj9zoU/I8CHaGnNsgfYfWBe4kv9uW0RrKqib4r+CMHSWwfa13a8XMd3ijok2I3AOgtdmK6jcLbhy1i9YP9YEonPl76TS0gqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622585; c=relaxed/simple;
	bh=f3OFMRUmnByeXDsr36+213ykBDaAtLfpaEiDz+Q9gxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7678hCsT3ZTCLcYqkBd154rKtl9ZxCois5LwqZCc8U4NlSkm4E6NbKY0QsLXK9tCFMpqQyACbkixihCQK0Y8u+8yK0fI3loBpTrFGGf49Z1YT6FUDeT+8O0Pzj+4kE64sBGnTPBioK9zccTgyVYfGfAnayA3hDEYeMWMITqkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfgClVQp; arc=none smtp.client-ip=209.85.210.53
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ecd7216cso120377a34.3
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622583; x=1784227383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSynCpTlkZr3xhq4uPTGumAVYY1t7kcTvSs03LT7yd4=;
        b=CfgClVQpzDYp4d+E/zjLosK8dJZek+khBRZVivtpzr05Td2wu/cn4OdGoZrKP8q9is
         mR0WJbbtSOu8KDRzDoL/S+wYo/xB1f+Oh8knPqSL1FNgJGtER6z4Tau6+DfBHXHfYKCN
         JE7IVhMdjwvmRRMUsTI3U9LaUFHVydqckZHlzgqCQaTf5LUHTL6usAwO6tc3fHCe/Mgd
         1Fn0zSIeB2b8639q7ho1P6FIIa86F1HH+UNlkUfd8UvVcRXTV+9IiALd/RCbhk+5Enb/
         4iufNXcwQiQzFfEJ2OmDhZ3yKUCZjnIIX3yACsTAoIhwGClolZwTcibnOdfcih1Z+2Mb
         uk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622583; x=1784227383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSynCpTlkZr3xhq4uPTGumAVYY1t7kcTvSs03LT7yd4=;
        b=VNsL/XYIfeAQhGCTP7LjyBOClXOHm8uU9AXo5t7xYWRIvfcmAaX2ukMUIjxbgSubYp
         rcjTtM7Tojn/jGFiNx3enHO8cBe4gzcwiNr6mB2+LNMDUcXnC0hVxYjrs4cLClWthCwx
         GnNySGHXghf2RDaOb/h3ApZhBvM9df7gm/ooF5xjzELe7JtgMG/UTTCXoGt7ITpnSf2d
         KQmSXQCA0tb+u/+p/Rr98lyLkEtppaAIe4Je3Vu6KT5r6S7OzjyTCPL9e3qiiZqxqK69
         K/giMkTocefIOlBwHjE6mr0/dlBjVtTiLiyoTNd2e+5X5jF+e8zvzyXY1iy3+Dk9tbLg
         2uag==
X-Forwarded-Encrypted: i=1; AFNElJ9od9ZjTAMo0iC+/9o3r1ROL1NtTJDlIOeeN28VHW/UOi6U+WYKRI/TdSoIFDFFd/Qu5bOvlS35@lists.linux.dev
X-Gm-Message-State: AOJu0YzI8deUp2vLJ+7XYHTRvHY3paSLdcP67wxw+fCr7AuQnvOQb3ux
	d2pUe6h9RBL6KTajmzVK7P0M1NfeHJmfDROMNWlftpFsat7pAF25eMn6
X-Gm-Gg: AfdE7cnxR4qLnAAzomihbZ8hqvPRuTUVsbdnuTc4a8iFsSAeY4RFVOD7i2zKCA9OdzJ
	ESVU8q1gc4udWPF8bhGmvnc1q5vxBq3JNZCX1PXFtmOV1OV/ircxd4TVlu2R0THqzxlAuvA0QuG
	l6ftUZAYksFNlLIjN+DR1LUYjw8zxocd+4HxPqHPrC/uaYlxRNP/w9tRUItRXLmD3i0ySPRnWS2
	8w4RZ9kzZBjekQ5MMQpsG/mBrYr8BubWIV2SSz2JIS9+1896aO0R3Fg8MVQNJXzQS7mF242vIFm
	DzT4b8On0KBP+OU9JOTcqaicW2EgDBzJS3q8RjJJS31gmK8CpUwKZQiggpX70MRnEFwMFhSK/oD
	QrdrRb7dgmZxrINxHYMyX9VxwA6j5ZXC1gumebEAPQnrepISqDersyRDtGlI9l1nTYGkfVUcSwj
	J66pvZMHw=
X-Received: by 2002:a05:6820:217:b0:6a1:7bd2:744b with SMTP id 006d021491bc7-6a36db430acmr5540354eaf.38.1783622582606;
        Thu, 09 Jul 2026 11:43:02 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a5ef513sm5205207eaf.6.2026.07.09.11.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:01 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:42:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <ak_rr7I4wVPieWYT@stanley.mountain>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak_WOfpcaZIuh99t@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-2956-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EA9F7349D0

On Thu, Jul 09, 2026 at 06:11:21PM +0100, Matthew Wilcox wrote:
> I agree that many memory allocations benefit from providing more semantic
> information to both the compiler and the runtime, as you suggest.
> What I don't think we benefit from is "And you have to pass this magic
> GFP_KERNEL argument too.  Unless it's GFP_ATOMIC or something".

You know that most people are using kzmalloc_obj() these days and so
they don't pass GFP_KERNEL...

regards,
dan carpenter


