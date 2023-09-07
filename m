Return-Path: <ksummit+bounces-1092-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BF7971AA
	for <lists@lfdr.de>; Thu,  7 Sep 2023 13:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163E82814A5
	for <lists@lfdr.de>; Thu,  7 Sep 2023 11:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F248568E;
	Thu,  7 Sep 2023 11:17:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7533C38
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 11:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2CFC116B8;
	Thu,  7 Sep 2023 11:17:47 +0000 (UTC)
Date: Thu, 7 Sep 2023 07:18:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig
 <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230907071801.1d37a3c5@gandalf.local.home>
In-Reply-To: <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
	<ZPkDLp0jyteubQhh@dread.disaster.area>
	<20230906215327.18a45c89@gandalf.local.home>
	<ZPkz86RRLaYOkmx+@dread.disaster.area>
	<20230906225139.6ffe953c@gandalf.local.home>
	<ZPlFwHQhJS+Td6Cz@dread.disaster.area>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Sep 2023 13:38:40 +1000
Dave Chinner <david@fromorbit.com> wrote:

> Hence, IMO, gutting a filesystem implementation to just support
> read-only behaviour "to prolong it's support life" actually makes
> things worse from a maintenance and testing persepective, not
> better....

=46rom your other email about 10 years support, you could first set a fs to
read-only, and then after so long (I'm not sure 10 years is really
necessary), then remove it.

That is, make it the stage before removal. If no one complains about it
being read-only after several years, then it's highly likely that no one is
using it. If someone does complain, you can tell them to either maintain
it, or start moving all their data to another fs.

For testing, you could even have an #ifdef that needs to be manually
changed (not a config option) to make it writable.

-- Steve

