Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C27CEF4C
	for <lists@lfdr.de>; Thu, 19 Oct 2023 07:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B3F1281E99
	for <lists@lfdr.de>; Thu, 19 Oct 2023 05:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3367717FD;
	Thu, 19 Oct 2023 05:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3739F
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D960F67373; Thu, 19 Oct 2023 07:46:42 +0200 (CEST)
Date: Thu, 19 Oct 2023 07:46:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Justin Stitt <justinstitt@google.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, ksummit@lists.linux.dev
Subject: the nul-terminated string helper desk chair rearrangement, was:
 Re: [PATCH] nvme-fabrics: replace deprecated strncpy with strscpy
Message-ID: <20231019054642.GF14346@lst.de>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 18, 2023 at 10:48:49PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.

If we want that we need to stop pretendening direct manipulation of
nul-terminate strings is a good idea.  I suspect the churn of replacing
one helper with another, maybe slightly better, one probably
introduces more bugs than it fixes.

If we want to attack the issue for real we need to use something
better.

lib/seq_buf.c is a good start for a lot of simple cases that just
append to strings including creating complex ones.  Kent had a bunch
of good ideas on how to improve it, but couldn't be convinced to
contribute to it instead of duplicating the functionality which
is a bit sad, but I think we need to switch to something like
seq_buf that actually has a counted string instead of all this messing
around with the null-terminated strings.


